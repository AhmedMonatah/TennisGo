import 'package:flutter/material.dart';
import 'package:weather_app/features/login/presentation/views/widget/splash/splashViewBody.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const routeName="splash";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SplashViewBody()),
    );
  }
}