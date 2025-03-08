import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';

class WindSpeedChart extends StatelessWidget {
  final Weather weather;

  const WindSpeedChart({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        backgroundColor: Colors.black12,
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 2,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('${value.toInt()}',
                      style: const TextStyle(color: Colors.white, fontSize: 12)),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 5, // ✅ Less Y-axis numbers (adjust as needed)
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text('${value.toInt()}',
                      style: const TextStyle(color: Colors.white, fontSize: 12)),
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
        lineBarsData: [
          LineChartBarData(
            spots: weather.forecast.asMap().entries.map((entry) {
              return FlSpot(entry.key.toDouble(), entry.value.windSpeed);
            }).toList(),
            isCurved: true,
            color: Colors.red,
            barWidth: 4,
            isStrokeCapRound: true,
          ),
        ],
      ),
    );
  }
}
