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
            return Container(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _inputField('ID', controllerId),
                  _inputField('Title', controllerTitle),
                  _inputField('Subtitle', controllerSubtitle),
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
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text(
                      'Add To Do',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
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
            fontWeight: FontWeight.normal,
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          child: TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter a $field',
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
