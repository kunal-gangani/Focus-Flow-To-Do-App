import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_todo_app/Controllers/todo_controller.dart';

class CompletedTodoView extends StatelessWidget {
  const CompletedTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final ToDoController todoController = Get.find<ToDoController>();

    return Scaffold(
      body: GetBuilder<ToDoController>(
        builder: (_) {
          final completedTodos = todoController.completedTodos;

          if (completedTodos.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.task_alt,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "No completed tasks yet",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Complete tasks will appear here",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: completedTodos.length,
            itemBuilder: (context, index) {
              final todo = completedTodos[index];
              return Dismissible(
                key: Key(todo.id.toString()),
                background: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (_) {
                  todoController.deleteTodo(id: todo.id);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green[700],
                      ),
                    ),
                    title: Text(
                      todo.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
