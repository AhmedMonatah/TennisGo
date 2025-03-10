import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/app_bar_home_page.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/condation_weather.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/weather_forecast_list.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/weather_metrics.dart';

class WeatherViewBody extends StatefulWidget {
  final Weather weather;

  const WeatherViewBody({super.key, required this.weather});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherViewBody> {
  int selectedDayIndex = 0;

  List<int> getConditionList() {
    final selectedWeather = widget.weather.forecast[selectedDayIndex];
    return [
      selectedWeather.cloudCover > 70 ? 1 : 0,    // Cloud cover
      (selectedWeather.condition == 'Sunny' || selectedWeather.condition == 'Clear') ? 0 : 1,  // Weather condition
      selectedWeather.dailyWillItRain > 35 ? 1 : 0,      // Rain chance
      selectedWeather.temperature > 35 ? 1 : 0,    // Temperature
      selectedWeather.humidity > 80 ? 1 : 0,       // Humidity
    ];
  }

  @override
  Widget build(BuildContext context) {
    final selectedWeather = widget.weather.forecast[selectedDayIndex];
    final weatherCubit = context.read<WeatherCubit>();
    final cityName = weatherCubit.currentCity;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarHomePage(icon: Icons.favorite, cityName: cityName),
            CondationWeather(selectedWeather: selectedWeather),
            const SizedBox(height: 15),
            WeatherForecastList(
              weather: widget.weather,
              selectedDayIndex: selectedDayIndex,
              onDaySelected: (index) {
                setState(() {
                  selectedDayIndex = index;
                });
              },
            ),
            const SizedBox(height: 5),
            WeatherMetrics(
              selectedWeather: selectedWeather,
              weather: widget.weather,
            ),
          ],
        ),
      ),
    );
  }
}
