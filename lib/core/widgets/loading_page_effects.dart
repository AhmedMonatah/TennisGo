import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RotatingLoadingWidget extends StatefulWidget {
  const RotatingLoadingWidget({super.key});

  @override
  _RotatingLoadingWidgetState createState() => _RotatingLoadingWidgetState();
}

class _RotatingLoadingWidgetState extends State<RotatingLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // Adjust speed as needed
      vsync: this,
    )..repeat(); // Rotates indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.3), // Darkened background effect
      child: Center(
        child: RotationTransition(
          turns: _controller,
          child: Image.asset(
            'assets/images/Logo.png', // Use your logo or loading icon
            height: 80,
            width: 80,
          ),
        ),
      ),
    );
  }
}
