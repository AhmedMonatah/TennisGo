import 'package:weather_app/features/home/auth/data/domin/entites/weather_entity.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required double temperature,
    required String condition,
    required double windSpeed,
    required num humidity,
    required num cloudCover,
    required List<WeatherDay> forecast,
  }) : super(
          temperature: temperature,
          condition: condition,
          windSpeed: windSpeed,
          humidity: humidity,
          cloudCover: cloudCover,
          forecast: forecast,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    // Safely parse forecast data with null checks
    List<WeatherDay> forecast = (json['forecast']['forecastday'] as List)
        .map((day) => WeatherDay(
              date: day['date'] ?? 'Unknown date', 
              temperature: (day['day']['avgtemp_c'] ?? 0.0).toDouble(), 
              condition: day['day']['condition']['text'] ?? 'Unknown', 
              humidity: day['day']['avghumidity'] ?? 0, 
              cloudCover: day['day']['cloud'] ?? 0, 
              dailyWillItRain: day['day']['will_it_rain'] ?? 0, // Check for correct key
            ))
        .toList();

    return WeatherModel(
      temperature: (json['current']['temp_c'] ?? 0.0).toDouble(),
      condition: json['current']['condition']['text'] ?? 'Unknown', 
      windSpeed: (json['current']['wind_kph'] ?? 0.0).toDouble(), 
      humidity: json['current']['humidity'] ?? 0, 
      cloudCover: json['current']['cloud'] ?? 0, 
      forecast: forecast,
    );
  }
}
