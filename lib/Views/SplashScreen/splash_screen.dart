import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pomodoro_todo_app/Routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    Timer(const Duration(seconds: 4), () {
      Get.offNamed(Routes.loginPage);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange.withOpacity(0.2),
                ),
                child: ScaleTransition(
                  scale: Tween(begin: 1.0, end: 1.2).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: Curves.easeInOut,
                    ),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.stopwatch,
                    size: 90.sp,
                    color: Colors.orange,
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              AnimatedOpacity(
                duration: const Duration(
                  seconds: 2,
                ),
                opacity: 1.0,
                child: Text(
                  'FocusFlow',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              AnimatedOpacity(
                duration: const Duration(
                  seconds: 3,
                ),
                opacity: 1.0,
                child: Text(
                  'Master your time with focused work & breaks.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
