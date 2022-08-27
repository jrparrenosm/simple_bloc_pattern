part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodosLoading extends TodoState {}

class TodosLoaded extends TodoState {
  final List<TodoModel> todos;

  const TodosLoaded({this.todos = const <TodoModel>[]});

  @override
  List<Object> get props => [todos];
}

class TodosError extends TodoState {}
