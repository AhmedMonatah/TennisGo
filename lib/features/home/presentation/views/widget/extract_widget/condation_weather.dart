import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/weather_icon.dart';

class CondationWeather extends StatelessWidget {
  final WeatherDay selectedWeather;

  const CondationWeather({super.key, required this.selectedWeather});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        children: [
          _buildWeatherConditionText(screenWidth),
          SizedBox(height: screenHeight * 0.015),
          WeatherIcon(condition: selectedWeather.condition, size: screenWidth * 0.2),
          SizedBox(height: screenHeight * 0.015),
          _buildTemperatureText(screenWidth),
        ],
      ),
    );
  }

  /// Widget for displaying the weather condition text
  Widget _buildWeatherConditionText(double screenWidth) {
    return Text(
      selectedWeather.condition,
      style: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          fontSize: screenWidth * 0.08,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  /// Widget for displaying the temperature text
  Widget _buildTemperatureText(double screenWidth) {
    return Text(
      '${selectedWeather.temperature}°C',
      style: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          fontSize: screenWidth * 0.07,
          fontWeight: FontWeight.w500,
          color: Colors.white70,
        ),
      ),
    );
  }
}
