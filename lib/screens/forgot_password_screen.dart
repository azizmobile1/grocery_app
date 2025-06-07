import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/screens/login_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_text_style.dart';
import 'package:grocery_app/widgets/build_tap_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          children: [
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
              child: Icon(
                Icons.arrow_back,
                color: AppColors.text2,
                size: 30.sp,
              ),
            ),
            SizedBox(width: 40.w),
            Text("Password Recovery", style: AppTextStyle.style14),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 50.h),
          Center(
            child: Column(
              spacing: 2,
              children: [
                SizedBox(
                  width: 280.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    "Forgot Password",
                    style: AppTextStyle.style7,
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 330.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                    style: AppTextStyle.style8,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          SizedBox(
            height: 60.h,
            width: 350.w,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined, color: AppColors.text1),
                hintText: "Email address",
                hintStyle: AppTextStyle.style13,
                filled: true,
                fillColor: AppColors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 18.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(height: 10.h),
          BuildTapWidget(text: "Send link"),
        ],
      ),
    );
  }
}
