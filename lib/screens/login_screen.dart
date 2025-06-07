import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/screens/forgot_password_screen.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/signup_screen.dart';
import 'package:grocery_app/screens/welcome_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_media.dart';
import 'package:grocery_app/utils/app_text_style.dart';
import 'package:grocery_app/widgets/build_icon_widget.dart';
import 'package:grocery_app/widgets/build_tap_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            fit: BoxFit.cover,
            AppMedia.welcome2,
            width: double.infinity,
            height: double.infinity,
          ),
          BuildIconWidget(
            text: "Welcome",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
              decoration: BoxDecoration(
                color: AppColors.background1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome back !", style: AppTextStyle.style7),
                  SizedBox(height: 5.h),
                  Text("Sign in to your account", style: AppTextStyle.style8),
                  SizedBox(height: 30.h),
                  addEmailAddress(
                    text: "Email Address",
                    icon: Icon(Icons.email_outlined),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: "Password",
                        labelStyle: AppTextStyle.style8,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.6,
                        child: Switch(
                          value: tap,
                          onChanged: (value) {
                            setState(() {
                              tap = value;
                            });
                          },
                          activeColor: AppColors.primaryDark,
                          inactiveThumbColor: AppColors.text1,
                        ),
                      ),
                      Text("Remember me", style: AppTextStyle.style8),
                      SizedBox(width: 15.w),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                            AppColors.link.withOpacity(0.2),
                          ),
                        ),
                        child: Text(
                          "Forgot password",
                          style: AppTextStyle.style11,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ),
                      );
                    },
                    child: BuildTapWidget(text: "Login"),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: AppTextStyle.style8,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignupScreen(),
                            ),
                          );
                        },
                        child: Text("Sign up", style: AppTextStyle.style10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container addEmailAddress({required String text, required Icon icon}) {
  final TextEditingController emailController = TextEditingController();

  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: TextField(
      controller: emailController,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: text,
        labelStyle: AppTextStyle.style8,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
