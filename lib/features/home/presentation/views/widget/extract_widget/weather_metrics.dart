import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';

class WeatherMetrics extends StatefulWidget {
  final WeatherDay selectedWeather;
  final Weather weather;

  const WeatherMetrics({super.key, required this.selectedWeather, required this.weather});

  @override
  _WeatherMetricsState createState() => _WeatherMetricsState();
}

class _WeatherMetricsState extends State<WeatherMetrics> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller.forward();
  }

    @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final indicatorSize = screenWidth * 0.35; // Adjust size dynamically

    return SingleChildScrollView( // Allows scrolling if overflow occurs
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _buildAnimatedCircularIndicator(
                    value: widget.selectedWeather.temperature / 50,
                    label: 'Temp',
                    data: '${widget.selectedWeather.temperature}°C',
                    size: indicatorSize,
                  ),
                ),
                Expanded(
                  child: _buildAnimatedCircularIndicator(
                    value: widget.weather.windSpeed / 100,
                    label: 'Wind Speed',
                    data: '${widget.weather.windSpeed} km/h',
                    size: indicatorSize,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _buildAnimatedCircularIndicator(
                    value: widget.selectedWeather.humidity / 100,
                    label: 'Humidity',
                    data: '${widget.selectedWeather.humidity}%',
                    size: indicatorSize,
                  ),
                ),
                Expanded(
                  child: _buildAnimatedCircularIndicator(
                    value: widget.selectedWeather.dailyWillItRain / 50,
                    label: 'Rain',
                    data: '${widget.selectedWeather.dailyWillItRain}%',
                    size: indicatorSize,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedCircularIndicator({
    required double value,
    required String label,
    required String data,
    required double size,
  }) {
    return SizedBox(
      width: size,
      height: size + 30, // Adjust to prevent overflow
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size * 0.9,
            height: size * 0.9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return CircularProgressIndicator(
                      value: value * _controller.value,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      color: Colors.white.withOpacity(0.8),
                      strokeWidth: 12,
                    );
                  },
                ),
                Center(
                  child: Text(
                    data,
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        color: Colors.black.withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
