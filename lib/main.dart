import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'simple_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const TodoApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}
