import 'package:get/get.dart';
import 'package:pomodoro_todo_app/Views/HomePage/home_page.dart';
import 'package:pomodoro_todo_app/Views/LoginPage/login_page.dart';
import 'package:pomodoro_todo_app/Views/RegisterPage/register_page.dart';
import 'package:pomodoro_todo_app/Views/SplashScreen/splash_screen.dart';

class Routes {
  static String splashScreen = '/';
  static String loginPage = '/login';
  static String registerPage = '/register';
  static String homePage = '/home';

  static List<GetPage> myRoutes = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: loginPage,
      page: () => LoginPage(),
    ),
    GetPage(
      name: registerPage,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: homePage,
      page: () => HomePage(),
    ),
  ];
}
