class Weather {
  final double temperature;
  final String condition;
  final double windSpeed;
  final num humidity; 
  final List<WeatherDay> forecast;
  final num cloudCover; 

  Weather({
    required this.temperature,
    required this.condition,
    required this.windSpeed,
    required this.humidity,   
    required this.forecast,
    required this.cloudCover,
  });
}

class WeatherDay {
  final String date;
  final double temperature;
  final String condition;
  final num humidity;
  final num cloudCover;
  final int dailyWillItRain; // New field
  final double windSpeed;   // Add this line

  WeatherDay( {
    required this.date,
    required this.temperature,
    required this.condition,
    required this.humidity,  
    required this.cloudCover, 
    required this.dailyWillItRain,
    required this.windSpeed, // Initialize the new field
  });
}
