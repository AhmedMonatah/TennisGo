import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';

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
          Text(
            selectedWeather.condition,
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(
                fontSize: screenWidth * 0.08, // Dynamic font size
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.015), // Dynamic spacing
          Icon(
            Icons.wb_sunny,
            size: screenWidth * 0.2, // Adjust icon size
            color: Colors.yellowAccent,
          ),
          SizedBox(height: screenHeight * 0.015), // Dynamic spacing
          Text(
            '${selectedWeather.temperature}°C',
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(
                fontSize: screenWidth * 0.07, // Dynamic font size
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
