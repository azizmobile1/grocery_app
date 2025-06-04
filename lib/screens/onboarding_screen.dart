import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grocery_app/screens/welcome_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_media.dart';
import 'package:grocery_app/utils/app_text_style.dart';
import 'package:grocery_app/widgets/build_tap_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                selectedPage = value;
              });
            },
            controller: pageController,
            children: [
              BuildFirstPage(),
              BuildNextPage(
                text: "Buy Quality Dairy Products",
                image: AppMedia.onboarding2,
              ),
              BuildNextPage(
                text: "Buy Premium Quality Fruits",
                image: AppMedia.onboarding3,
              ),
              BuildNextPage(
                text: "Get Discounts On All Products",
                image: AppMedia.onboarding4,
              ),
            ],
          ),
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                if (selectedPage == 3) {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) {
                        return WelcomeScreen();
                      },
                    ),
                  );
                } else {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                }
              },
              child: buildTap(),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.68),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 10.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: selectedPage == index
                        ? AppColors.primary
                        : AppColors.white,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildFirstPage extends StatelessWidget {
  const BuildFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppMedia.onboarding1, fit: BoxFit.cover),
        Positioned(
          top: 80,
          right: 0,
          left: 0,
          child: Column(
            spacing: 2,
            children: [
              Text(
                textAlign: TextAlign.center,
                "Welcome to",
                style: AppTextStyle.style1,
              ),
              RichText(
                text: TextSpan(
                  style: AppTextStyle.style3,
                  text: "BIG ",
                  children: [
                    TextSpan(text: "CART", style: AppTextStyle.style4),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 330.w,
                child: Text(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                  style: AppTextStyle.style5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BuildNextPage extends StatelessWidget {
  String text;
  String image;
  BuildNextPage({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(image, fit: BoxFit.cover),
        Positioned(
          top: 80,
          right: 0,
          left: 0,
          child: Column(
            spacing: 2,
            children: [
              SizedBox(
                width: 280.w,
                child: Text(
                  textAlign: TextAlign.center,
                  text,
                  style: AppTextStyle.style1,
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 330.w,
                child: Text(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                  style: AppTextStyle.style5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Container buildTap() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
    margin: EdgeInsets.symmetric(horizontal: 16.w),
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
    child: Text("Get started", style: AppTextStyle.style2),
  );
}
