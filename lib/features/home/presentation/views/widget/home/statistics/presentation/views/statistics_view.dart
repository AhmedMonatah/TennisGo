import 'package:flutter/material.dart';
import 'package:weather_app/core/utiles/strings.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/statistics/presentation/widgets/chart_card.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/statistics/presentation/widgets/humidity_chart.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/statistics/presentation/widgets/temperature_chart.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/statistics/presentation/widgets/wind_speed_chart.dart';

class StatisticsView extends StatelessWidget {
  final Weather weather;

  const StatisticsView({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          ChartCard(
            title: AppStrings.TemperatureTitle,
            icon: Icons.thermostat,
            chart: TemperatureChart(weather: weather),
          ),
          const SizedBox(height: 20),
          ChartCard(
            title: AppStrings.HumidityTitle,
            icon: Icons.water_damage,
            chart: HumidityChart(weather: weather),
          ),
          const SizedBox(height: 20),
          ChartCard(
            title: AppStrings.WindSpeedTitle,
            icon: Icons.air,
            chart: WindSpeedChart(weather: weather),
          ),
        ],
      ),
    );
  }
}
