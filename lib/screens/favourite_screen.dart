import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_media.dart';
import 'package:grocery_app/utils/app_text_style.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
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
            SizedBox(width: 80.w),
            Text("Favorites", style: AppTextStyle.style14),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          spacing: 10,
          children: [
            cardFavoriteWidget(
              color: AppColors.color6,
              img: AppMedia.vegetable6,
              text: "Fresh Broccoli",
            ),
            cardFavoriteWidget(
              color: AppColors.color4,
              img: AppMedia.vegetable4,
              text: "Black Grapes",
            ),
            cardFavoriteWidget(
              color: AppColors.color2,
              img: AppMedia.vegetable2,
              text: "Avacado",
            ),
            cardFavoriteWidget(
              color: AppColors.color3,
              img: AppMedia.vegetable3,
              text: "Pinapple",
            ),
          ],
        ),
      ),
    );
  }
}

Container cardFavoriteWidget({
  required String img,
  required Color color,
  required String text,
}) {
  return Container(
    padding: EdgeInsets.all(10.r),
    color: AppColors.white,
    child: Row(
      spacing: 20.h,
      children: [
        SizedBox(
          width: 70.w,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(backgroundColor: color, radius: 40.r),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Image.asset(img, fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$2.22 x 4",
              style: TextStyle(fontSize: 10.sp, color: AppColors.primary),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            ),
            Text(
              "1.50lbs",
              textAlign: TextAlign.center,
              style: AppTextStyle.style13,
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, color: AppColors.primary),
            ),
            Text("5", textAlign: TextAlign.center, style: AppTextStyle.style13),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove, color: AppColors.primary),
            ),
          ],
        ),
      ],
    ),
  );
}
