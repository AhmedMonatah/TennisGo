import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/helper_function/get_current_location_and_city.dart';
import 'package:weather_app/core/utiles/strings.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/custome_home_text_field.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/search_button.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentLocationAndCity(cityController: cityController, context: context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 29),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Training Image
            Image.asset(
              AppStrings.SearchViewImage,
              height: screenHeight * 0.35, // Responsive height
            ),
            const SizedBox(height: 20),

            // Centered "Training Day" Text
            Center(
              child: Text(
                AppStrings.SearchViewSubtitle,
                textAlign: TextAlign.center, // Ensures text is centered
                style: GoogleFonts.ubuntu(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 79, 78, 78),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Search Field
            CustomeHomeTextField(cityController: cityController),
            const SizedBox(height: 20),

            // Search Button
            SearchButton(cityController: cityController, title: 'Search'),
          ],
        ),
      ),
    );
  }
}
