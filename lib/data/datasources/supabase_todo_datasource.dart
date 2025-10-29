import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/todo_model.dart';

class SupabaseTodoDatasource {
  final SupabaseClient _client = Supabase.instance.client;
  final String table = 'todos';

  Future<List<TodoModel>> getTodos() async {
    final response = await _client.from(table).select().order('id', ascending: false);
    return (response as List).map((e) => TodoModel.fromJson(e)).toList();
  }

  Future<void> addTodo(TodoModel todo) async {
    await _client.from(table).insert({
      'title': todo.title,
      'description': todo.description,
      'is_completed': todo.isCompleted,
    });
  }

  Future<void> updateTodo(int id, bool isCompleted) async {
    await _client.from(table).update({'is_completed': isCompleted}).eq('id', id);
  }

  Future<void> deleteTodo(int id) async {
    await _client.from(table).delete().eq('id', id);
  }
}
