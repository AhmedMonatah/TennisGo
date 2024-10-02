import 'package:flutter/material.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';

class WeatherMetrics extends StatelessWidget {
  final WeatherDay selectedWeather;
  final Weather weather;

  const WeatherMetrics({super.key, required this.selectedWeather, required this.weather});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCircularIndicator(
          value: selectedWeather.temperature / 50,
          label: 'Temp',
          data: '${selectedWeather.temperature}°C',
          screenWidth: screenWidth,
        ),
        _buildCircularIndicator(
          value: weather.windSpeed / 100,
          label: 'Wind Speed',
          data: '${weather.windSpeed} km/h',
          screenWidth: screenWidth,
        ),
        _buildCircularIndicator(
          value: selectedWeather.humidity / 100,
          label: 'Humidity',
          data: '${selectedWeather.humidity}%',
          screenWidth: screenWidth,
        ),
        _buildCircularIndicator(
          value: selectedWeather.dailyWillItRain / 50,
          label: 'Rain',
          data: '${selectedWeather.dailyWillItRain}%',
          screenWidth: screenWidth,
        ),
      ],
    );
  }

  Widget _buildCircularIndicator({
    required double value,
    required String label,
    required String data,
    required double screenWidth,
  }) {
    return Column(
      children: [
        SizedBox(
          width: screenWidth * 0.2,
          height: screenWidth * 0.2,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: value,
                backgroundColor: Colors.white.withOpacity(0.1),
                color: Colors.blueAccent,
                strokeWidth: 6,
              ),
              Center(
                child: Text(
                  data,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 9),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
