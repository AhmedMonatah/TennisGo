import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/fav_view/favorite_view.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/search_view/search_view.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/weather_view/weather_view.dart';
import 'package:weather_app/features/login/presentation/views/widget/sign_in/signin_view.dart';
import 'package:weather_app/features/login/presentation/views/widget/sign_up/signup_view.dart';
import 'package:weather_app/features/login/presentation/views/widget/splash/splashScreen.dart';
Route<dynamic> onGenerateRoute(RouteSettings settings){
switch(settings.name){
case SplashScreen.routeName:
  return MaterialPageRoute(builder: (context) =>const SplashScreen(),);
case SigninView.routeName:
  return MaterialPageRoute(builder: (context) =>const SigninView(),);
case SignupView.routeName:
  return MaterialPageRoute(builder: (context) =>const SignupView(),);
case SearchView.routeName:
  return MaterialPageRoute(builder: (context) =>const SearchView(),);
case WeatherView.routeName:
  return MaterialPageRoute(builder: (context) =>const WeatherView(),);
case FavoriteView.routeName:
  return MaterialPageRoute(builder: (context) =>const FavoriteView(),);
default:
  return MaterialPageRoute(builder: (context) =>const Scaffold(),); 
}
}
