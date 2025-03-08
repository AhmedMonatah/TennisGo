import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String condition;
  final double size;

  const WeatherIcon({super.key, required this.condition, required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      _getWeatherIcon(condition),
      size: size,
      color: Colors.yellowAccent,
    );
  }

  /// Function to get the correct icon based on weather condition
  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny':
      case 'clear':
        return Icons.wb_sunny;
      case 'cloudy':
      case 'partly cloudy':
        return Icons.cloud;
      case 'rainy':
      case 'showers':
        return Icons.beach_access;
      case 'stormy':
      case 'thunderstorm':
        return Icons.thunderstorm;
      case 'snowy':
        return Icons.ac_unit;
      case 'foggy':
      case 'mist':
        return Icons.foggy;
      default:
        return Icons.wb_cloudy; // Default icon for unknown conditions
    }
  }
}
