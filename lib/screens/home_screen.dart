import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/screens/card_screen.dart';
import 'package:grocery_app/screens/categories_screen.dart';
import 'package:grocery_app/screens/favourite_screen.dart';
import 'package:grocery_app/screens/filter_screen.dart';
import 'package:grocery_app/screens/product_detail_screen.dart';
import 'package:grocery_app/screens/profile_screen.dart';
import 'package:grocery_app/screens/vegetables_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_media.dart';
import 'package:grocery_app/utils/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(initialPage: 0);
  int selectedPageIndex = 0;
  late Timer _timer;
  ScrollController scrollController = ScrollController();
  int selectedProductIndex = 0;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    _startTimer();
  }

  void _scrollListener() {
    bool isVisible = scrollController.offset < 320;

    if (!isVisible && _timer.isActive) {
      _timer.cancel();
    } else if (isVisible && !_timer.isActive) {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 8), (Timer timer) {
      if (selectedPageIndex < 3) {
        selectedPageIndex++;
      } else {
        selectedPageIndex = 0;
      }

      pageController.animateToPage(
        selectedPageIndex,
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    _timer.cancel();
  }

  List<String> svgPaths = [
    "assets/svgs/vega.svg",
    "assets/svgs/fruit.svg",
    "assets/svgs/bvg.svg",
    "assets/svgs/grocery.svg",
    "assets/svgs/oil.svg",
    "assets/svgs/vacum.svg",
  ];

  List<String> names = [
    "Vegetabels",
    "Fruits",
    "Beverages",
    "Grocery",
    "Edible oil",
    "Househ",
  ];

  List<Color> colors = [
    AppColors.color1,
    AppColors.color2,
    AppColors.color3,
    AppColors.color4,
    AppColors.color5,
    AppColors.color6,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.white,
              AppColors.background1,
              AppColors.background2,
            ],
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 18, right: 16),
            child: ListView(
              controller: scrollController,
              children: [
                searchWidget(),
                SizedBox(height: 10.h),
                pageViewCards(),
                SizedBox(height: 10.h),
                categoriesWidget(
                  text: "Categories",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoriesScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VegetablesScreen(),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10, left: 10),
                              decoration: BoxDecoration(
                                color: colors[index],
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(20),
                              child: SvgPicture.asset(svgPaths[index]),
                            ),
                          ),
                          Text(
                            names[index],
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                categoriesWidget(text: "Featured products"),
                Column(
                  spacing: 25,
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
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = 0;
          });
          if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavouriteScreen()),
            );
          } else if (value == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CardScreen()),
            );
          } else if (value == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
        elevation: 0,
        showSelectedLabels: false,
        unselectedItemColor: AppColors.text1,
        selectedIconTheme: IconThemeData(size: 35.sp, color: AppColors.text2),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "shopping",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "profile",
          ),
        ],
      ),
    );
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
          Row(
            children: [
              Text("New", style: AppTextStyle.style12),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border, color: AppColors.text1),
              ),
            ],
          ),

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
              color: Colors.green,
              fontFamily: "Poppins",
            ),
          ),

          Text(
            prductName,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: "Poppins",
            ),
          ),
          Text(lbs, textAlign: TextAlign.center, style: AppTextStyle.style13),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailScreen()),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.white)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag_outlined, color: Colors.green),
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
          ),
        ],
      ),
    );
  }

  Row categoriesWidget({required String text, VoidCallback? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: onTap,
          icon: Icon(Icons.arrow_forward_ios_outlined),
        ),
      ],
    );
  }

  Stack pageViewCards() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 280.h,
          child: PageView(
            onPageChanged: (value) {
              setState(() {
                selectedPageIndex = value;
              });
            },
            controller: pageController,
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppMedia.home1),
                  ),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 90, bottom: 60),
                  child: SizedBox(
                    width: 180.w,
                    child: Text(
                      "20% off on your first purchase",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppMedia.home2),
                    ),
                  ),
                  width: 300.w,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppMedia.home3),
                  ),
                ),
                width: 300.w,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppMedia.home4),
                  ),
                ),
                width: 300.w,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                margin: EdgeInsets.only(right: 10.w),
                decoration: BoxDecoration(
                  color: selectedPageIndex == index
                      ? Colors.green
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                width: selectedPageIndex == index ? 30 : 10,
                height: 10.h,
              );
            }),
          ),
        ),
      ],
    );
  }

  TextField searchWidget() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.background1,
        hintStyle: TextStyle(color: AppColors.text1),
        hintText: "Search keywords",
        prefixIcon: Icon(Icons.search, color: AppColors.text1),
        suffixIcon: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FilterScreen()),
            );
          },
          icon: Icon(Icons.tune, color: AppColors.text1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.background1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.primaryLight),
        ),
      ),
    );
  }
}
