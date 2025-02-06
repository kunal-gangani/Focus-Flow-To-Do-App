import 'package:get/get.dart';
import 'package:pomodoro_todo_app/Models/todo_model.dart';
import 'package:pomodoro_todo_app/Services/database_services.dart';

class ToDoController extends GetxController {
  List<ToDoModel> todoList = [];
  List<ToDoModel> completedTodos = [];

  final DatabaseServices _dbService = DatabaseServices.databaseServices;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
    fetchCompletedTodos();
  }

  // Fetch Todos from Database
  Future<void> fetchTodos() async {
    todoList = await _dbService.fetchTodo();
    update();
  }

  // Add Todo to Database
  Future<void> addTodo({required String title}) async {
    final newTodo = ToDoModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
    );

    await _dbService.insertTodo(todoModel: newTodo);
    fetchTodos();
  }

  // Update Todo in Database
  Future<void> updateTodo({required int id, required String newTitle}) async {
    final updatedTodo = ToDoModel(id: id, title: newTitle);
    await _dbService.updateTodo(todoModel: updatedTodo);
    fetchTodos();
  }

  // Fetch Completed Todos
  Future<void> fetchCompletedTodos() async {
    completedTodos = await _dbService.fetchCompletedTodo();
    update();
  }

  // Delete Todo from Database
  Future<void> deleteTodo({required int id}) async {
    await _dbService.deleteTodo(id: id);
    fetchTodos();
  }

  // Mark Todo as Completed
  Future<void> markTodoAsCompleted({required int id}) async {
    await _dbService.markTodoAsCompleted(id: id);
    fetchTodos();
    fetchCompletedTodos();
  }
}
