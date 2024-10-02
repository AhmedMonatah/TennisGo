import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/services/shared_preferences_singleton.dart';

class FavoritesCubit extends Cubit<List<String>> {
  FavoritesCubit() : super(Prefs.getStringList('favCities') ?? []);

  void toggleFavorite(String cityName) {
    final favCities = List<String>.from(state);

    if (favCities.contains(cityName)) {
      favCities.remove(cityName);
    } else {
      favCities.add(cityName);
    }

    Prefs.setStringList('favCities', favCities); // Save to SharedPreferences
    emit(favCities); // Emit the updated list of favorites
  }

  void loadFavorites() {
    final favCities = Prefs.getStringList('favCities') ?? [];
    emit(favCities);
  }
}
