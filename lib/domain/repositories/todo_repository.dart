import '../entities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getTodos();
  Future<void> addTodo(TodoEntity todo);
  Future<void> updateTodo(int id, bool isCompleted);
  Future<void> deleteTodo(int id);
}
