import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/welcome_screen.dart';
import 'package:grocery_app/utils/app_text_style.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                selectedPage = value;
              });
            },
            controller: pageController,
            children: [
              buildFirstPage(),
              buildNextPage(
                text: "Buy Quality Dairy Products",
                image: "assets/images/splash_screen_image2.jpg",
              ),
              buildNextPage(
                text: "Buy Premium Quality Fruits",
                image: "assets/images/splash_screen_image3.jpg",
              ),
              buildNextPage(
                text: "Get Discounts On All Products",
                image: "assets/images/splash_screen_image4.jpg",
              ),
            ],
          ),
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                if (selectedPage == 3) {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) {
                        return WelcomeScreen();
                      },
                    ),
                  );
                } else {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: Text(
                  "Get started",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Poppins",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.68),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: selectedPage == index ? Colors.green : Colors.white,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class buildFirstPage extends StatelessWidget {
  const buildFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/splash_screen_image1.jpg",
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 80,
          right: 0,
          left: 0,
          child: Column(
            spacing: 2,
            children: [
              Text(
                textAlign: TextAlign.center,
                "Welcome to",
                style: AppTextStyle.style,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 32, color: Colors.green.shade200),
                  text: "BIG ",
                  children: [
                    TextSpan(
                      text: "CART",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Colors.green.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 330,
                child: Text(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                  style: TextStyle(fontSize: 15, fontFamily: "Poppins"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class buildNextPage extends StatelessWidget {
  String text;
  String image;
  buildNextPage({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(image, fit: BoxFit.cover),
        Positioned(
          top: 80,
          right: 0,
          left: 0,
          child: Column(
            spacing: 2,
            children: [
              SizedBox(
                width: 270,
                child: Text(
                  textAlign: TextAlign.center,
                  text,
                  style: AppTextStyle.style,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 330,
                child: Text(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                  style: TextStyle(fontSize: 15, fontFamily: "Poppins"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
