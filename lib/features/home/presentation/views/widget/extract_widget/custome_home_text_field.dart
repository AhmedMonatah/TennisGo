import 'package:flutter/material.dart';
import 'package:weather_app/core/utiles/app_color.dart';
import 'package:weather_app/core/utiles/app_text_styles.dart';

class CustomeHomeTextField extends StatelessWidget {
  const CustomeHomeTextField({
    required this.cityController,
    super.key,
  });

  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cityController,
      style: const TextStyle(
        color: Colors.black, // Text color
      ),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 17), // Adjust padding for height
          hintStyle: TextStyles.bold13.copyWith(
            color: const Color(0xFF949D9E),
          ),
          hintText:' Location',
          filled: true,
          fillColor: const Color.fromRGBO(200,239,216 ,1), // Light green background
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: focusedBorder(),
        ),
    );
  }
  
  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15), // Rounded corners
      borderSide: const BorderSide(
        color: AppColor.borderColor,
        width: 0,
      ),
    );
  }

  OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15), // Rounded corners
      borderSide: const BorderSide(
        color: AppColor.LightPrimaryColor,
        width: 3,
      ),
    );
  }
}