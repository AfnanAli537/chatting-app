import 'package:chatting_app/core/routes/app_routes.dart';
import 'package:chatting_app/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top icon
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: Colors.black,
                  child: const Icon(Icons.shield_outlined, color: Colors.white),
                ),
                SizedBox(height: 16.h),

                // Title
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.h),

                // Subtitle
                Text(
                  "Join SecureChat for private messaging",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 24.h),

                // Form fields
                AppTextField(
                  label: "Username",
                  hint: "Choose a username",
                  controller: usernameController,
                  prefixIcon: Icons.person_outline,
                ),
                SizedBox(height: 16.h),
                AppTextField(
                  label: "Email",
                  hint: "Enter your email",
                  controller: emailController,
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(height: 16.h),
                AppTextField(
                  label: "Password",
                  hint: "Create a password",
                  controller: passwordController,
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                ),
                SizedBox(height: 16.h),
                AppTextField(
                  label: "Confirm Password",
                  hint: "Confirm your password",
                  controller: confirmPasswordController,
                   prefixIcon: Icons.lock_outline,
                 
                ),
                SizedBox(height: 24.h),

                // Create Account button
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),

                // Sign In text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",
                        style: TextStyle(color: Colors.grey[700])),
                    GestureDetector(
                      onTap: ()=> Navigator.pushNamed(context,AppRoutes.login),
                      child: Text("Sign In",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                    ),),
                    
                  ],
                ),
                SizedBox(height: 24.h),

                // Footer text
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "Your data is encrypted and secure. We never share your information.",
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
