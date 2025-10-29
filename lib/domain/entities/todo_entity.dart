class TodoEntity {
  final int? id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime? createdAt;

  TodoEntity({
    this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    this.createdAt,
  });
}
