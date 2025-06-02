import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/screens/welcome_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_media.dart';
import 'package:grocery_app/utils/app_text_style.dart';
import 'package:grocery_app/widgets/build_icon_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(AppMedia.welcome2, width: double.infinity),
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
            top: 445.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
              width: 411.w,
              height: 470.h,
              decoration: BoxDecoration(
                color: AppColors.background1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome back !", style: AppTextStyle.style7),
                    SizedBox(height: 10.h),
                    Text("Sign in to your account", style: AppTextStyle.style8),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
