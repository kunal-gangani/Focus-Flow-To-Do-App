import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_todo_app/Routes/routes.dart';

class NavigationController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  PageController pageController = PageController();

  int get selectedIndex => _selectedIndex.value;

  void changeItem(int index) {
    _selectedIndex.value = index;
  }

  void changePageView({
    required int index,
  }) {
    pageController.animateToPage(
      index,
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.easeInOut,
    );
  }

  // Navigations to screens
  void navigateToRegisterPage() => Get.offNamed(Routes.registerPage);
  void navigateToLoginPage() => Get.offNamed(Routes.loginPage);
  void navigateToHomePage() => Get.offNamed(Routes.homePage);
}
