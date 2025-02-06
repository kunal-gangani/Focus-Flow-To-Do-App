import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_todo_app/Controllers/navigation_controller.dart';
import 'package:pomodoro_todo_app/Views/HomePage/PageViews/completed_todo_view.dart';
import 'package:pomodoro_todo_app/Views/HomePage/PageViews/pomodoro_todo_view.dart';
import 'package:pomodoro_todo_app/Views/HomePage/PageViews/todo_page_view.dart';
import 'package:pomodoro_todo_app/Views/HomePage/Widgets/app_bar_widget.dart';
import 'package:pomodoro_todo_app/Views/HomePage/Widgets/navigation_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController navigationValue = Get.put(NavigationController());
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: appBarWidget(),
      body: PageView(
        controller: navigationValue.pageController,
        onPageChanged: (index) {
          navigationValue.changeItem(index);
        },
        children: [
          TodoPageView(),
          PomodoroTodoView(),
          CompletedTodoView(),
        ],
      ),
      bottomNavigationBar: navigationBar(),
    );
  }
}
