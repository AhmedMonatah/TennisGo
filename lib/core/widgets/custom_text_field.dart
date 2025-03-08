import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/utiles/app_color.dart';
import 'package:weather_app/core/utiles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 390),
      child: TextFormField(
        obscureText: obscureText,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        keyboardType: textInputType,
        style:GoogleFonts.ubuntu(textStyle:const TextStyle(fontSize: 18) ) , // Increase font size for height
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 17), // Adjust padding for height
          suffixIcon: suffixIcon,
          hintStyle: TextStyles.bold13.copyWith(
            color: const Color(0xFF949D9E),
          ),
          hintText: hintText,
          filled: true,
          fillColor: Colors.lightGreen[100], // Light green background
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: focusedBorder(),
        ),
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