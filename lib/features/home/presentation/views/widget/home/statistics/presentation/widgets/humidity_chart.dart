import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';

class HumidityChart extends StatelessWidget {
  final Weather weather;

  const HumidityChart({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        backgroundColor: Colors.black12,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('Day ${value.toInt()}', style: const TextStyle(color: Colors.white, fontSize: 12)),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 12,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0,top: 2),
                  child: Text('${value.toInt()}%', style: const TextStyle(color: Colors.white, fontSize: 12)),
                );
              },
            ),
          ),
           rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false), 
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false), 
          ),
        ),
        borderData: FlBorderData(show: true),
        barGroups: weather.forecast.asMap().entries.map((entry) {
          return BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(
                fromY: 0,
                toY: entry.value.humidity.toDouble(),
                gradient: LinearGradient(
                  colors: [Colors.green.withOpacity(0.7), Colors.green],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
