import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';

class WeatherChart extends StatelessWidget {
  final Weather weather;
  final WeatherDay selectedWeather;

  const WeatherChart({
    super.key,
    required this.weather,
    required this.selectedWeather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(color: Colors.white),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text('Today', style: TextStyle(color: Colors.white));
                    case 1:
                      return const Text('Tomorrow', style: TextStyle(color: Colors.white));
                    case 2:
                      return const Text('Day 3', style: TextStyle(color: Colors.white));
                    default:
                      return const Text('', style: TextStyle(color: Colors.white));
                  }
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
          ),
          gridData: FlGridData(show: true, drawHorizontalLine: true),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              belowBarData: BarAreaData(show: true),
              spots: [
                FlSpot(0, selectedWeather.temperature.toDouble()),
                FlSpot(1, weather.forecast[1].temperature.toDouble()),
                FlSpot(2, weather.forecast[2].temperature.toDouble()),
              ],
              dotData: FlDotData(show: true, getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(color: Colors.white, strokeWidth: 2, strokeColor: Colors.blue);
              }),
              barWidth: 4,
              isStrokeCapRound: true,
            ),
          ],
          lineTouchData: LineTouchData(enabled: true),
          maxX: 2,
          maxY: weather.forecast.map((e) => e.temperature).reduce((a, b) => a > b ? a : b).toDouble(),
        ),
      ),
    );
  }
}