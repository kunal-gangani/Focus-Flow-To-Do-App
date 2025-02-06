class ToDoModel {
  int id;
  String title;

  ToDoModel({required this.id, required this.title});

  factory ToDoModel.fact({required Map<String, dynamic> data}) {
    return ToDoModel(
      id: data['todo_id'],
      title: data['todo_name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'todo_id': id,
      'todo_name': title,
    };
  }
}
