import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_pattern/models/todo_model.dart';
import 'package:simple_bloc_pattern/todos/bloc/todo_bloc.dart';

class AddTodoPage extends StatefulWidget {
  static const String routeName = "/add-todo-page";

  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerId = TextEditingController();
    TextEditingController controllerTitle = TextEditingController();
    TextEditingController controllerSubtitle = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left)),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return const CircularProgressIndicator();
          }
          if (state is TodosLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _inputField('ID', controllerId),
                _inputField('Title', controllerTitle),
                _inputField('SubTitle', controllerSubtitle),
                ElevatedButton(
                  onPressed: () {
                    var todo = TodoModel(
                      id: controllerId.value.text,
                      title: controllerTitle.value.text,
                      subTitle: controllerSubtitle.value.text,
                    );
                    context.read<TodoBloc>().add(AddTodo(todo: todo));
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  child: const Text('Add To Do'),
                ),
              ],
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }

  Column _inputField(
    String field,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$field: ',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          child: TextFormField(
            controller: controller,
          ),
        ),
      ],
    );
  }
}
