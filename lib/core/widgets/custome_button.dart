import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 17), // Reduced margin for better spacing
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed, // Use the passed function
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          text, // Use the dynamic text instead of hardcoded 'Sign In'
          style: GoogleFonts.ubuntu(
            textStyle: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
