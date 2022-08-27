import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:simple_bloc_pattern/models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodosLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  void _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) {
    emit(TodosLoaded(todos: event.todos));
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      emit(
        TodosLoaded(
          todos: List.from(state.todos)..add(event.todo),
        ),
      );
    }
  }

  void _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) {}

  void _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) {}
}
