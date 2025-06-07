import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_text_style.dart';

class BuildTapWidget extends StatefulWidget {
  final String text;

  const BuildTapWidget({super.key, required this.text});

  @override
  State<BuildTapWidget> createState() => _BuildTapWidgetState();
}

class _BuildTapWidgetState extends State<BuildTapWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 350.w,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 18.h),
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
      child: Text(widget.text, style: AppTextStyle.style2),
    );
  }
}
