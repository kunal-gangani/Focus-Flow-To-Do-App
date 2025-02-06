class PomodoroToDoModel {
  int? id;
  String name;
  int duration;

  PomodoroToDoModel({
    this.id,
    required this.name,
    required this.duration,
  });

  factory PomodoroToDoModel.fromMap({required Map<String, dynamic> data}) {
    return PomodoroToDoModel(
      id: data['pomodoro_todo_id'],
      name: data['pomodoro_todo_name'],
      duration: data['pomodoro_duration'],
    );
  }

  Map<String, dynamic> get toMap {
    return {
      'pomodoro_todo_id': id,
      'pomodoro_todo_name': name,
      'pomodoro_duration': duration,
    };
  }
}
