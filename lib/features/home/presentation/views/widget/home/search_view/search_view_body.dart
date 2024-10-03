import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/helper_function/get_user.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/custome_home_text_field.dart';
import 'package:weather_app/features/home/presentation/views/widget/extract_widget/search_button.dart';

class SearchViewBody extends StatefulWidget {
  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController cityController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getCurrentLocationAndCity();
  }

Future<void> getCurrentLocationAndCity() async {
  bool serviceEnabled;
  LocationPermission permission;

  try {
    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location services are disabled.");
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        print("Location permissions are denied.");
        return;
      }
    }

    // Try to get the current position
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // Get the placemarks from the coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    
    // Check if placemarks are not empty and set the city
    if (placemarks.isNotEmpty) {
      String? city = placemarks.first.locality;
      setState(() {
        cityController.text = city ?? ''; 
      });
    } else {
      print("No placemarks found.");
    }
  } catch (e) {
    // Handle specific error cases
    if (e is PlatformException) {
      print('Failed to get location: ${e.message}');
      if (e.code == 'IO_ERROR') {
        print("Location services may be temporarily unavailable.");
      }
    } else {
      print('An unexpected error occurred: $e');
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hello',
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 8),
          Text(
            getUser().name,
            style: const TextStyle(
              fontSize: 30,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          Center(
            heightFactor: 4,
            child: CustomeHomeTextField(cityController: cityController,),
          ),
          const SizedBox(height: 16),
          SearchButton(cityController: cityController,title: 'Search'),
        ],
      ),
    );
  }
}

