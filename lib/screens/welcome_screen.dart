import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/screens/onboarding_screen.dart';
import 'package:grocery_app/screens/signup_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_media.dart';
import 'package:grocery_app/utils/app_text_style.dart';
import 'package:grocery_app/widgets/build_google_widget.dart';
import 'package:grocery_app/widgets/build_icon_widget.dart';
import 'package:grocery_app/widgets/login_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(AppMedia.welcome1, width: double.infinity),
          BuildIconWidget(
            text: "Welcome",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnboardingScreen(),
                ),
              );
            },
          ),
          Positioned(
            top: 505.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
              width: 411.w,
              height: 400.h,
              decoration: BoxDecoration(
                color: AppColors.background1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome", style: AppTextStyle.style7),
                  SizedBox(height: 15.h),
                  Text(
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                    style: AppTextStyle.style8,
                  ),
                  SizedBox(height: 30.h),
                  BuildGoogleWidget(),
                  SizedBox(height: 20.h),

                  tapWidget(
                    onTap: () {
                      log("bosildi");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                  ),

                  SizedBox(height: 15.h),
                  LoginWidget(
                    text1: "Already have an account ?",
                    text2: "Login",
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

Widget tapWidget({required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(10.r),
    child: Container(
      height: 60.h,
      width: 380.w,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 18.w, horizontal: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.primaryDark,
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 6.r,
            color: AppColors.primary.withOpacity(0.8),
            offset: Offset(0, 7.h),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppMedia.profil),
          SizedBox(width: 60.w),
          Text("Create an account", style: AppTextStyle.style2),
        ],
      ),
    ),
  );
}
