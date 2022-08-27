import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_pattern/models/todo_model.dart';
import 'package:simple_bloc_pattern/todos/bloc/todo_bloc.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todo;

  const TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: const BorderRadius.all(Radius.circular(5.0))),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 5.0),
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(todo.subTitle),
                ],
              )),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.amber,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          );
        },
      ),
    );
  }
}
