import 'package:flutter/material.dart';
import 'package:grocery_app/screens/login_screen.dart';
import 'package:grocery_app/utils/app_text_style.dart';

class LoginWidget extends StatelessWidget {
  final String text1;
  final String text2;
  const LoginWidget({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text1, style: AppTextStyle.style8),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text(text2, style: AppTextStyle.style10),
          ),
        ],
      ),
    );
  }
}
