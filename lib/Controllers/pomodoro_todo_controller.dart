import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pomodoro_todo_app/Models/todo_model.dart';
import 'package:pomodoro_todo_app/Services/database_services.dart';

class PomodoroTodoController extends GetxController {
  List<ToDoModel> pomodoroTodoList = [];

  final DatabaseServices _dbService = DatabaseServices.databaseServices;

  @override
  void onInit() {
    super.onInit();
    fetchPomodoroTodos();
  }

  Future<void> fetchPomodoroTodos() async {
    pomodoroTodoList = await _dbService.fetchPomodoroTodos();
    update();
  }

  Future<void> addPomodoroTodo(
      {required String title, required int workSessions}) async {
    final newTodo = ToDoModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
    );

    await _dbService.insertPomodoroTodo(
        todoModel: newTodo, workSessions: workSessions);
    fetchPomodoroTodos();
  }

  Future<void> updatePomodoroProgress({required int id}) async {
    await _dbService.updatePomodoroProgress(id: id);
    fetchPomodoroTodos();
  }

  Future<void> deletePomodoroTodo({required int id}) async {
    await _dbService.deletePomodoroTodo(id: id);
    fetchPomodoroTodos();
  }
}
