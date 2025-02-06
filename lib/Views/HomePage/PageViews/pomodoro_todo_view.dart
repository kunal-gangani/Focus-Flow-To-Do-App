import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_todo_app/Controllers/pomodoro_todo_controller.dart';
import 'package:pomodoro_todo_app/Models/todo_model.dart';

class PomodoroTodoView extends StatelessWidget {
  const PomodoroTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final PomodoroTodoController todoController =
        Get.put<PomodoroTodoController>(PomodoroTodoController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<PomodoroTodoController>(
          builder: (controller) {
            if (controller.pomodoroTodoList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "No Pomodoro Tasks! Add some 😊",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: controller.pomodoroTodoList.length,
              itemBuilder: (context, index) {
                final ToDoModel todo = controller.pomodoroTodoList[index];
                return Card(
                  elevation: 6,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.orange.shade700,
                      child: const Icon(
                        Icons.timer,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      todo.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "Work Sessions: ${todo.id}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.update,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            todoController.updatePomodoroProgress(id: todo.id);
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            todoController.deletePomodoroTodo(id: todo.id);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange.shade700,
        shape: const CircleBorder(),
        elevation: 6,
        onPressed: () {
          _showAddPomodoroDialog(
            context,
            todoController,
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showAddPomodoroDialog(
      BuildContext context, PomodoroTodoController controller) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController durationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            "Add Pomodoro Task",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Task Name",
                  prefixIcon: const Icon(
                    Icons.edit,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: durationController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Work Sessions",
                  prefixIcon: const Icon(
                    Icons.timelapse,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                String name = nameController.text.trim();
                int? workSessions = int.tryParse(
                  durationController.text.trim(),
                );

                if (name.isNotEmpty &&
                    workSessions != null &&
                    workSessions > 0) {
                  controller.addPomodoroTodo(
                      title: name, workSessions: workSessions);
                  Get.back();
                }
              },
              child: const Text(
                "Add",
              ),
            ),
          ],
        );
      },
    );
  }
}
