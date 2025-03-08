import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/core/services/shared_preferences_singleton.dart';
import 'package:weather_app/features/login/presentation/views/widget/onboarding/onbord.dart';
import 'package:weather_app/features/login/presentation/views/widget/sign_in/signin_view.dart';

class SplashViewBody extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _rotationAnimation = Tween<double>(begin: -0.1, end: 0.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();

    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    bool seenOnboarding = Prefs.getBool("seenOnboarding");

    if (seenOnboarding) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SigninView()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Onboarding()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: RotationTransition(
            turns: _rotationAnimation,
            child: Shimmer.fromColors(
              baseColor: Colors.lightGreen,
              highlightColor: Colors.white,
              child: Image.asset(
                'assets/images/Logo.png',
                height: 150,
                width: 150,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
