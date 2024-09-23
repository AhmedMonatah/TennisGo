import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/home_view.dart';
import 'package:weather_app/features/login/presentation/views/widget/sign_in/signin_view.dart';
import 'package:weather_app/features/login/presentation/views/widget/sign_up/signup_view.dart';
import 'package:weather_app/features/login/presentation/views/widget/splash/splshScreen.dart';
Route<dynamic> onGenerateRoute(RouteSettings settings){
switch(settings.name){
case SplashScreen.routeName:
  return MaterialPageRoute(builder: (context) =>const SplashScreen(),);
case SigninView.routeName:
  return MaterialPageRoute(builder: (context) =>const SigninView(),);
case SignupView.routeName:
  return MaterialPageRoute(builder: (context) =>const SignupView(),);
case HomeView.routeName:
  return MaterialPageRoute(builder: (context) =>const HomeView(),);
default:
  return MaterialPageRoute(builder: (context) =>const Scaffold(),); 
}
}
