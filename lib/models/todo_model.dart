import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String id;
  final String title;
  final String subTitle;

  const TodoModel(
      {required this.id, required this.title, required this.subTitle});

  TodoModel copyWith({
    String? id,
    String? title,
    String? subTitle,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
    );
  }

  @override
  List<Object?> get props => [id, title, subTitle];
}
