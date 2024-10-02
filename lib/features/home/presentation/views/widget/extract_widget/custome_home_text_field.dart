import 'package:flutter/material.dart';

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
        filled: true,
        fillColor: Colors.white,
        hintText: 'Destination',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}