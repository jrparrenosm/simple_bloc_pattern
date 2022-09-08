import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_pattern/todos/page/sample_todo.dart';

import 'models/todo_model.dart';
import 'todos/bloc/todo_bloc.dart';
import 'todos/page/add_todo_view.dart';
import 'todos/page/todo_page.dart';

// class CounterApp extends MaterialApp {
//   const CounterApp({super.key}) : super(home: const CounterPage());
// }

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoBloc()),
      ],
      child: MaterialApp(
        title: 'Welcome to Flutter',
        home: const SampleTodo(),
        routes: {
          TodoPage.routeName: (ctx) => const TodoPage(),
          SampleTodo.routeName: (ctx) => const SampleTodo(),
        },
      ),
    );
  }
}
