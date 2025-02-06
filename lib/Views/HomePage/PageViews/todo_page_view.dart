import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_todo_app/Controllers/todo_controller.dart';

class TodoPageView extends StatelessWidget {
  TodoPageView({super.key});

  final ToDoController todoController = Get.put(ToDoController());
  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<ToDoController>(
          builder: (_) {
            final todos = todoController.todoList;

            if (todos.isEmpty) {
              return const Center(
                child: Text(
                  "No todos found",
                ),
              );
            }
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: Checkbox(
                      value: false,
                      onChanged: (val) {
                        if (val == true) {
                          todoController.markTodoAsCompleted(id: todo.id);
                        }
                      },
                    ),
                    title: Text(
                      todo.title,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          "Insert ToDo",
        ),
        backgroundColor: Colors.orange,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Add New Todo",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: "Enter a task",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_todoController.text.isNotEmpty) {
                          todoController.addTodo(
                            title: _todoController.text,
                          );
                          _todoController.clear();
                          Get.back();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Add Task",
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        icon: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
