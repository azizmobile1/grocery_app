import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_text_style.dart';
import 'package:grocery_app/widgets/build_tap_widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
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
            Text("Apply Filters", style: AppTextStyle.style14),
            Icon(Icons.refresh_sharp, color: AppColors.text2),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              color: AppColors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 15.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Price Range", style: AppTextStyle.style10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: textFieldWidget(
                          hintText: "Min.",
                          color: AppColors.background1,
                        ),
                      ),
                      SizedBox(
                        width: 150.w,
                        child: textFieldWidget(
                          hintText: "Max.",
                          color: AppColors.background1,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Text("Start Raiting", style: AppTextStyle.style10),

                  Container(
                    padding: EdgeInsets.all(12.r),
                    color: AppColors.background1,
                    child: Row(
                      children: [
                        Row(
                          children: List.generate(5, (int index) {
                            return IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.star, color: Colors.amber),
                            );
                          }),
                        ),
                        Spacer(),
                        Text(
                          "5 stars",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.style13,
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Text("Others", style: AppTextStyle.style10),
                  othersBolim(icon: Icons.discount_outlined, name: "Discount"),
                  Divider(),
                  othersBolim(
                    icon: Icons.local_shipping_outlined,
                    name: "Free Shopping",
                    color: AppColors.primary,
                  ),
                  Divider(),
                  othersBolim(
                    icon: Icons.delivery_dining_outlined,
                    name: "Same Day delivery",
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
            Spacer(),
            BuildTapWidget(text: "Apply filter"),
          ],
        ),
      ),
    );
  }
}

Row othersBolim({required icon, required String name, Color? color}) {
  return Row(
    spacing: 20.h,
    children: [
      Icon(icon, color: AppColors.text1),
      Text(name, textAlign: TextAlign.center, style: AppTextStyle.style13),
      Spacer(),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.check_circle_outline, color: color ?? AppColors.text1),
      ),
    ],
  );
}

TextField textFieldWidget({
  String? hintText,
  preffixIcon,
  suffixIcon,
  Color? color,
}) {
  return TextField(
    cursorColor: AppColors.text1,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color ?? AppColors.white),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color ?? AppColors.white),
      ),

      suffixIcon: suffixIcon,
      prefixIcon: preffixIcon,
      hintStyle: TextStyle(color: AppColors.text1, fontSize: 13.sp),

      hintText: hintText,

      border: InputBorder.none,
      filled: true,
      fillColor: color ?? AppColors.white,
    ),
  );
}
