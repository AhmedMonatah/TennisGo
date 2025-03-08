import 'package:flutter/material.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';

class WeatherForecastList extends StatelessWidget {
  final Weather weather;
  final int selectedDayIndex;
  final Function(int) onDaySelected;

  const WeatherForecastList({
    super.key,
    required this.weather,
    required this.selectedDayIndex,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weather.forecast.length,
        itemBuilder: (context, index) {
          final day = weather.forecast[index];
          bool isSelected = index == selectedDayIndex;

          return GestureDetector(
            onTap: () => onDaySelected(index),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.tealAccent : Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day.date.split('-').last,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${day.temperature}°C',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
