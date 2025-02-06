import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFA500),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange.shade100,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.shade200,
                      blurRadius: 8.sp,
                      spreadRadius: 4.sp,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person_add,
                  size: 100,
                  color: Color(0xFFFFA500),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Fill the details below to create an account.',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              // Email TextField
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  prefixIcon: const Icon(
                    Icons.email,
                  ),
                  hintText: 'Enter your email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20.h,
              ),
              // Password TextField
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  hintText: 'Enter your password',
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              // Confirm Password TextField
              TextField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  hintText: 'Confirm your password',
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 30.h,
              ),
              // Register Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFA500),
                  padding: EdgeInsets.symmetric(
                    vertical: 15.sp,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  minimumSize: Size(
                    double.infinity,
                    50.h,
                  ),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // Already have an account Text
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Already have an account? Login here',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.orange,
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
