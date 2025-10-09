import 'package:chatting_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.h,),
              // Icon
              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.black,
                child: Icon(Icons.shield_outlined,
                    color: Colors.white, size: 28),
              ),
              SizedBox(height: 24.h),
          
              // Title + Subtitle
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // SizedBox(height: 6.h),
              Text(
                "Sign in to your secure account",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 30.h),
              // Email Field
              AppTextField(
                label: "Email",
                hint: "Enter your email",
                controller: emailController,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
           SizedBox(height: 18.h,),
              // Password Field
              AppTextField(
                label: "Password",
                hint: "Enter your password",
                controller: passwordController,
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              SizedBox(height: 28.h),
          
              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () {
                    // Handle login
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
          
              // Sign Up text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  ),
                  GestureDetector(
                    onTap: () =>
                      // Navigate to SignUp
                      Navigator.pushNamed(context, AppRoutes.register),
                   
                   
                    child: Text( "Sign Up",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    ),
                 
                ],
              ),
              SizedBox(height: 24.h),
          
           
            ],
          ),
        ),
      ),
    );
  }
}
