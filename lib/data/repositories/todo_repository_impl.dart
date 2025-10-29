import '../../domain/entities/todo_entity.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/supabase_todo_datasource.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final SupabaseTodoDatasource datasource;

  TodoRepositoryImpl(this.datasource);

  @override
  Future<List<TodoEntity>> getTodos() async {
    final todos = await datasource.getTodos();
    return todos
        .map((todo) => TodoEntity(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      isCompleted: todo.isCompleted,
      createdAt: todo.createdAt,
    ))
        .toList();
  }

  @override
  Future<void> addTodo(TodoEntity todo) async =>
      await datasource.addTodo(TodoModel(
        title: todo.title,
        description: todo.description,
      ));

  @override
  Future<void> updateTodo(int id, bool isCompleted) async =>
      await datasource.updateTodo(id, isCompleted);

  @override
  Future<void> deleteTodo(int id) async =>
      await datasource.deleteTodo(id);
}
