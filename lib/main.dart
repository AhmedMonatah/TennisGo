import 'package:weather_app/core/helper_function/on_generate_route.dart';
import 'package:weather_app/core/services/custome_bloc_observer.dart';
import 'package:weather_app/core/services/get_it_services.dart';
import 'package:weather_app/core/utiles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weather_app/features/presentation/views/widget/splash/splshScreen.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer= CustomeBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(const TennisWeather());
}

class TennisWeather extends StatelessWidget {
  const TennisWeather({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColor.backgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute:onGenerateRoute,
      initialRoute:SplashScreen.routeName,
    );
  }
}
