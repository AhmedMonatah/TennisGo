import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/weather_view/weather_view.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.cityController,
    required this.title,
  });

  final TextEditingController cityController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Adjusted padding
      child: SizedBox(
        width: double.infinity, // Ensures full width
        height: 60,
        child: ElevatedButton(
          onPressed: () {
            final city = cityController.text;
            context.read<WeatherCubit>().fetchWeather(city);
            Navigator.pushReplacementNamed(context, WeatherView.routeName);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            minimumSize: const Size(double.infinity, 60), // Ensures button expands fully
          ),
          child: Text(
            title,
            style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
