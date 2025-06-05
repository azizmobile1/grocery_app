import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/review_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_media.dart';
import 'package:grocery_app/utils/app_text_style.dart';
import 'package:grocery_app/widgets/build_tap_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 410.h,
            child: Image.asset(AppMedia.productImage),
          ),
          Positioned(
            top: 20.h,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
              },
              icon: Icon(Icons.arrow_back, size: 35.sp),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20.r),
              height: 420.h,
              decoration: BoxDecoration(
                color: AppColors.background1,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("\$2.22", style: AppTextStyle.style15),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_outline,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Organic Lemons",
                    style: AppTextStyle.style7,
                  ),
                  Text(
                    "1.50 lbs",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.style13,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReviewScreen()),
                      );
                    },
                    child: Text(
                      "4.5 ⭐️⭐️⭐️⭐️⭐️ (89reviews)",
                      style: AppTextStyle.style13,
                    ),
                  ),
                  Text(
                    maxLines: 5,
                    "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing",
                    style: AppTextStyle.style16,
                  ),
                  QuantityCounter(),
                  BuildTapWidget(text: "Add to cart"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuantityCounter extends StatefulWidget {
  const QuantityCounter({super.key});

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int quantity = 3;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Quantity', style: AppTextStyle.style8),
          Spacer(),
          IconButton(
            onPressed: decrement,
            icon: const Icon(Icons.remove),
            color: AppColors.primaryDark,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r)),
            child: Text('$quantity', style: const TextStyle(fontSize: 16)),
          ),
          IconButton(
            onPressed: increment,
            icon: const Icon(Icons.add),
            color: AppColors.primaryDark,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
