class Todo {
  final int id;
  final String titile;
  final bool completed;

  Todo({required this.id, required this.titile, required this.completed});

  Todo copyWith({int? id, String? titile, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      titile: titile ?? this.titile,
      completed: completed ?? this.completed,
    );
  }
}
