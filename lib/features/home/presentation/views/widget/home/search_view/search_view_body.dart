import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helper_function/get_user.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/custome_home_text_field.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/search_button.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/weather_view/weather_view.dart';

class SearchViewBody extends StatelessWidget {
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hello',
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 8),
          Text(
            getUser().name,
            style: const TextStyle(
              fontSize: 30,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          Center(
            heightFactor: 4,
            child: CustomeHomeTextField(cityController: cityController,),
          ),
          const SizedBox(height: 16),
          SearchButton(cityController: cityController,title: 'Search'),
        ],
      ),
    );
  }
}

