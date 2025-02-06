import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pomodoro_todo_app/Controllers/navigation_controller.dart';

Widget navigationBar() {
  NavigationController navigationValue = Get.put(NavigationController());
  return NavigationBarTheme(
    data: NavigationBarThemeData(
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 12.0.sp,
          color: Colors.white,
        ),
      ),
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
    child: NavigationBar(
      elevation: 3,
      selectedIndex: navigationValue.selectedIndex,
      onDestinationSelected: (index) {
        navigationValue.changeItem(index);
        navigationValue.changePageView(index: index);
      },
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: const [
        NavigationDestination(
          label: "To-Do",
          icon: Icon(
            CupertinoIcons.square_favorites,
            color: Colors.blueAccent,
          ),
        ),
        NavigationDestination(
          label: "Pomodoro",
          icon: Icon(
            Icons.group_add,
            color: Colors.cyan,
          ),
        ),
        NavigationDestination(
          label: "Completed To-Do",
          icon: Icon(
            Icons.memory,
            color: Colors.orange,
          ),
        ),
      ],
      backgroundColor: Colors.grey.shade800,
      indicatorColor: Colors.grey.shade500,
    ),
  );
}
