part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class LoadTodosInitial extends TodoEvent {}

class LoadTodos extends TodoEvent {
  final List<TodoModel> todos;

  const LoadTodos({this.todos = const <TodoModel>[]});

  @override
  List<Object> get props => [todos];
}

class AddTodo extends TodoEvent {
  final TodoModel todo;

  const AddTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}

class UpdateTodo extends TodoEvent {
  final TodoModel todo;

  const UpdateTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}

class DeleteTodo extends TodoEvent {
  final TodoModel todo;

  const DeleteTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}
