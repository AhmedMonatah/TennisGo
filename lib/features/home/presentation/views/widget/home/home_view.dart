
import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/custome_app_bar.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BuildAppBar(context, title: 'Home'),
        body: const HomeViewBody(),
      );
  }
}
