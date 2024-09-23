import 'package:flutter/material.dart';
import 'dart:async';

import 'package:weather_app/features/login/presentation/views/widget/sign_in/signin_view.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    SwitchToNextPage();
  }

  void SwitchToNextPage() {
    Timer(const Duration(seconds: 4), () {
  Navigator.pushReplacementNamed(context, SigninView.routeName);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/loader.gif'), // Splash screen image
            ],
          ),
        ),
      ),
    );
  }
}
