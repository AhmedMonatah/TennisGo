import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/prediction_view/Prediction_view_body.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart'; // Import the Weather entity

class PreductionView extends StatelessWidget {
  static const routeName = 'PreductionView';

  // Add a Weather parameter to the constructor
  final Weather weather;

  const PreductionView({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Color.fromRGBO(156,231,187, 1) ,),
      backgroundColor: Color.fromRGBO(156,231,187, 1), // dark blue background
      body: PredictionViewBody(weather: weather), // Pass the weather object
    );
  }
}
