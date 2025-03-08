import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/utiles/app_color.dart';
import 'package:weather_app/core/utiles/strings.dart';
import 'package:weather_app/features/login/presentation/views/widget/onboarding/models.dart';
import 'package:weather_app/features/login/presentation/views/widget/sign_in/signin_view.dart';

import 'onboarding_page.dart';
import 'onboarding_dot.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Skip Button
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 20),
              child: TextButton(
                onPressed: () => goToHomeScreen(),
                child: Text(
                  AppStrings.skip,
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.OnBoardingHeadText.withOpacity(0.45),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return OnboardingPage(content: contents[i]);
              },
            ),
          ),

          // Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index),
            ),
          ),

          // Next Button
          buildNextButton(),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return OnboardingDot(isActive: currentIndex == index);
  }

  Widget buildNextButton() {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(40),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (currentIndex == contents.length - 1) {
            goToHomeScreen();
          } else {
            _controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          currentIndex == contents.length - 1 ? AppStrings.Continue : AppStrings.Next,
          style: GoogleFonts.ubuntu(
            textStyle: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }

  void goToHomeScreen() {
            Navigator.pushNamed(context, SigninView.routeName);

  }
}
