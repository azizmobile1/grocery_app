import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/screens/login_screen.dart';
import 'package:grocery_app/screens/onboarding_screen.dart';
import 'package:grocery_app/screens/signup_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_media.dart';
import 'package:grocery_app/utils/app_text_style.dart';
import 'package:grocery_app/widgets/build_icon_widget.dart';

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
        children: [
          Image.asset(
            AppMedia.welcome1,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
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
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
              width: double.infinity,
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
                  Text("Welcome", style: AppTextStyle.style7),
                  SizedBox(height: 15.h),
                  Text(
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                    style: AppTextStyle.style8,
                  ),
                  SizedBox(height: 30.h),
                  buildGoogle(),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 18.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppMedia.profil),
                          SizedBox(width: 60.w),
                          Text("Create an account", style: AppTextStyle.style2),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ?",
                          style: AppTextStyle.style8,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginScreen();
                                },
                              ),
                            );
                          },
                          child: Text(" Login", style: AppTextStyle.style10),
                        ),
                      ],
                    ),
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

Container buildGoogle() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(5.r),
    ),
    child: Row(
      children: [
        Image.asset(AppMedia.google),
        SizedBox(width: 60.w),
        Text("Continue with google", style: AppTextStyle.style9),
      ],
    ),
  );
}
