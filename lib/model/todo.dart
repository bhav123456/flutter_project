class Todo {
  String? id;
  String? title;
  bool? isdone;

  Todo({required this.id, required this.title, this.isdone = false});
  static List<Todo> Todolist() {
    return [
      Todo(id: "1", title: "my first todo", isdone: true),
      Todo(id: "2", title: "my second todo"),
      Todo(id: "3", title: "my third todo")
    ];
  }
}
