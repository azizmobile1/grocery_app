import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_text_style.dart';

class BuildIconWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap; 

  const BuildIconWidget({
    super.key,
    required this.text,
    this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20.w,
      top: 60.h,
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap ?? () {},
            child: Icon(Icons.arrow_back, color: AppColors.white, size: 30.sp),
          ),
          SizedBox(width: 90.w),
          if (text != null) Text(text!, style: AppTextStyle.style6),
        ],
      ),
    );
  }
}
