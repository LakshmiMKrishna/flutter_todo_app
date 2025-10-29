part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object?> get props => [];
}

class LoadTodos extends TodoEvent {}
class AddTodo extends TodoEvent {
  final TodoEntity todo;
  const AddTodo(this.todo);
}
class ToggleTodo extends TodoEvent {
  final int id;
  final bool isCompleted;
  const ToggleTodo(this.id, this.isCompleted);
}
class DeleteTodo extends TodoEvent {
  final int id;
  const DeleteTodo(this.id);
}
