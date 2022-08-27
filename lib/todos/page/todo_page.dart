import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_pattern/models/todo_model.dart';
import 'package:simple_bloc_pattern/todos/bloc/todo_bloc.dart';
import 'package:simple_bloc_pattern/todos/page/add_todo_view.dart';

import 'widgets/todo_item.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  static const String routeName = "/todo-page";

  const TodoPage({super.key});

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
