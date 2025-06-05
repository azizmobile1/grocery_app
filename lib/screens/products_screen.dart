import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_media.dart';
import 'package:grocery_app/utils/app_text_style.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
            Text("Vegetables", style: AppTextStyle.style14),
            Icon(Icons.tune, color: AppColors.text2),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardWidget(
                  375,
                  color: AppColors.primaryLight,
                  img: AppMedia.vegetable1,
                  lbs: "1.50lbs",
                  prductName: "Pinapple",
                  price: "8.00",
                ),
                cardWidget(
                  375,
                  color: AppColors.primaryLight,
                  img: AppMedia.vegetable2,
                  lbs: "5.0lbs",
                  prductName: "Black Grapes",
                  price: "7.05",
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardWidget(
                  375,
                  color: AppColors.primaryLight,
                  img: AppMedia.vegetable3,
                  lbs: "dozen",
                  prductName: "Fresh Peach",
                  price: "8.00",
                ),
                cardWidget(
                  375,
                  color: AppColors.primaryLight,
                  img: AppMedia.vegetable4,
                  lbs: "5.0lbs",
                  prductName: "Avacado",
                  price: "7.05",
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardWidget(
                  375,
                  color: AppColors.primaryLight,
                  img: AppMedia.vegetable5,
                  lbs: "1.50lbs",
                  prductName: "Pomegrante",
                  price: "2.09",
                ),
                cardWidget(
                  375,
                  color: AppColors.primaryLight,
                  img: AppMedia.vegetable6,
                  lbs: "1kg",
                  prductName: "Fresh B Rocci",
                  price: "3.00",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Container cardWidget(
  double width, {
  required String price,
  required String prductName,
  required String lbs,
  required String img,
  required Color color,
}) {
  return Container(
    width: 165.w,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Column(
      children: [
        Text("New", style: AppTextStyle.style12),
        SizedBox(
          width: 110.w,
          height: 90.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: CircleAvatar(radius: 45.r, backgroundColor: color),
              ),
              Center(child: Image.asset(img, fit: BoxFit.cover)),
            ],
          ),
        ),

        Text(
          "\$$price",
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.primaryDark,
            fontFamily: "Poppins",
          ),
        ),

        Text(
          prductName,
          style: TextStyle(fontWeight: FontWeight.w700, fontFamily: "Poppins"),
        ),
        Text(lbs, textAlign: TextAlign.center, style: AppTextStyle.style13),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.white)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_bag_outlined, color: AppColors.primaryDark),
              SizedBox(width: 8.w),
              Text(
                "Add to cart",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
