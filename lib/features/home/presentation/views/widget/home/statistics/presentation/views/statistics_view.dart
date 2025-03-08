import 'package:flutter/material.dart';
import 'package:weather_app/core/utiles/strings.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/statistics/presentation/widgets/chart_card.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/statistics/presentation/widgets/humidity_chart.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/statistics/presentation/widgets/temperature_chart.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/statistics/presentation/widgets/wind_speed_chart.dart';

class StatisticsView extends StatefulWidget {
  final Weather weather;

  const StatisticsView({Key? key, required this.weather}) : super(key: key);

  @override
  _StatisticsViewState createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation, // Apply fade animation to the whole page
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ChartCard(
              title: AppStrings.TemperatureTitle,
              icon: Icons.thermostat,
              chart: TemperatureChart(weather: widget.weather),
            ),
            const SizedBox(height: 20),
            ChartCard(
              title: AppStrings.HumidityTitle,
              icon: Icons.water_damage,
              chart: HumidityChart(weather: widget.weather),
            ),
            const SizedBox(height: 20),
            ChartCard(
              title: AppStrings.WindSpeedTitle,
              icon: Icons.air,
              chart: WindSpeedChart(weather: widget.weather),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
