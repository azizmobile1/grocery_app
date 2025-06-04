import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_media.dart';
import 'package:grocery_app/utils/app_text_style.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 80.h,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
              child: Icon(
                Icons.arrow_back,
                color: AppColors.text2,
                size: 30.sp,
              ),
            ),
            Text("Categories", style: AppTextStyle.style14),
            Icon(Icons.tune, color: AppColors.text2),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                categoriesWidget(
                  color: AppColors.color1,
                  title: "Vegetables",
                  iconPath: AppMedia.category1,
                ),
                categoriesWidget(
                  color: AppColors.color2,
                  title: "Fruits",
                  iconPath: AppMedia.category2,
                ),
                categoriesWidget(
                  color: AppColors.color3,
                  title: "Beverages",
                  iconPath: AppMedia.category3,
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                categoriesWidget(
                  color: AppColors.color4,
                  title: "Grocery",
                  iconPath: AppMedia.category4,
                ),
                categoriesWidget(
                  color: AppColors.color5,
                  title: "Edible oil",
                  iconPath: AppMedia.category5,
                ),
                categoriesWidget(
                  color: AppColors.color6,
                  title: "Household",
                  iconPath: AppMedia.category6,
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: 5.w),
                Container(
                  width: 105.w,
                  height: 121.h,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  color: AppColors.white,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          AppMedia.category7,
                          width: 50.w,
                          height: 50.w,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Babycare",
                        style: AppTextStyle.style13,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget categoriesWidget({
  required Color color,
  required String title,
  required String iconPath,
}) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        color: AppColors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: SvgPicture.asset(iconPath, width: 50.w, height: 50.w),
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: AppTextStyle.style13,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
