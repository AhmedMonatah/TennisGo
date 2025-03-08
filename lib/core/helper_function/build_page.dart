import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import 'package:weather_app/core/utiles/strings.dart';
import 'package:weather_app/core/widgets/loading_page_effects.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/fav_view/favorite_view_body.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/prediction_view/prediction_view.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/search_view/search_view.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/statistics/presentation/views/statistics_view.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/weather_view/weather_view_body.dart';

List<Widget> buildPages(BuildContext context) {
  return [
    BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: RotatingLoadingWidget());
        } else if (state is WeatherSuccess) {
          return WeatherViewBody(weather: state.weather);
        } else if (state is WeatherError) {
          Future.delayed(Duration.zero, () {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: AppStrings.TitleProblemWeather,
              text: AppStrings.TextProblemWeather,
              confirmBtnText: AppStrings.Retry,
              confirmBtnColor: Colors.lightGreen,
              onConfirmBtnTap: () {
                Navigator.pushReplacementNamed(context, SearchView.routeName);
              },
            );
          });

          return const Center(
            child: Text(
              AppStrings.NoWeatherAvailable,
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return const Center(
            child: Text(
              AppStrings.NoWeatherAvailable,
              style: TextStyle(color: Colors.white),
            ),
          );
        }
      },
    ),
    const FavoriteViewBody(),
    BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return StatisticsView(weather: state.weather);
        } else {
          return const Center(
            child: Text(
              AppStrings.NoPredictionStatisticsAvailable,
              style: TextStyle(color: Colors.white),
            ),
          );
        }
      },
    ),
    BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return PreductionView(weather: state.weather);
        } else {
          return const Center(
            child: Text(
              AppStrings.NoPredictionAvailable,
              style: TextStyle(color: Colors.white),
            ),
          );
        }
      },
    ),
  ];
}
