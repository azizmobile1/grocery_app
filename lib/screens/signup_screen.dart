import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/login_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_media.dart';
import 'package:grocery_app/utils/app_text_style.dart';
import 'package:grocery_app/widgets/build_icon_widget.dart';
import 'package:grocery_app/widgets/build_tap_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            AppMedia.welcome3,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          BuildIconWidget(
            text: "Welcome",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: AppColors.background1,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Create account", style: AppTextStyle.style7),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: 300.w,
                      child: Text(
                        "Quickly create account",
                        style: AppTextStyle.style8,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      children: [
                        addEmailAddress(
                          text: "Email address",
                          icon: Icon(Icons.email_outlined),
                        ),
                        SizedBox(height: 10.h),
                        addEmailAddress(
                          text: "Phone number",
                          icon: Icon(Icons.phone),
                        ),
                        SizedBox(height: 10.h),
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
                                borderRadius: BorderRadius.circular(8),
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
                      ],
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: BuildTapWidget(text: "SignUp"),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ?",
                          style: AppTextStyle.style8,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Login", style: AppTextStyle.style10),
                        ),
                      ],
                    ),
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

TextField textFieldWidget({
  required TextEditingController controller,
  String? hintText,
  preffixIcon,
  suffixIcon,
  Color? color,
  bool obscureText = false,
}) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    cursorColor: AppColors.primaryDark,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color ?? AppColors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color ?? AppColors.white),
      ),
      suffixIcon: suffixIcon,
      prefixIcon: preffixIcon,
      hintStyle: TextStyle(color: AppColors.white, fontSize: 13.sp),
      hintText: hintText,
      border: InputBorder.none,
      filled: true,
      fillColor: color ?? AppColors.white,
    ),
  );
}
