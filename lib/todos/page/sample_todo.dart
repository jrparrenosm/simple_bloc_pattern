import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_pattern/todos/bloc/todo_bloc.dart';

import '../../models/todo_model.dart';
import 'add_todo_view.dart';
import 'widgets/todo_item.dart';

class SampleTodo extends StatefulWidget {
  static const String routeName = "/sample-todo-page";

  const SampleTodo({Key? key}) : super(key: key);

  @override
  State<SampleTodo> createState() => _SampleTodoState();
}

class _SampleTodoState extends State<SampleTodo> {
  @override
  void initState() {
    resetStateBloc();
    initialLoadTodo();
    super.initState();
  }

  void resetStateBloc() {
    final todoBloc = ReadContext(context).read<TodoBloc>();
    todoBloc.add(LoadTodosInitial());
  }

  void initialLoadTodo() {
    final todoBloc = ReadContext(context).read<TodoBloc>();
    final state = todoBloc.state;

    Future.delayed(const Duration(seconds: 5), () {
      todoBloc.add(
        const LoadTodos(
          todos: [
            TodoModel(
                id: "1", title: "First Todo", subTitle: "This is my first"),
            TodoModel(
                id: "2", title: "Second Todo", subTitle: "This is my second"),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Home'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTodoPage(),
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return const CircularProgressIndicator();
          }
          if (state is TodosLoaded) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.todos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TodoItem(
                            todo: state.todos[index],
                          );
                        })
                  ],
                ),
              ),
            );
          } else {
            return const Text("Something went wrong");
          }
        },
      ),
    );
  }
}
