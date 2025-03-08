import 'package:weather_app/core/helper_function/on_generate_route.dart';
import 'package:weather_app/core/services/custome_bloc_observer.dart';
import 'package:weather_app/core/services/get_it_services.dart';
import 'package:weather_app/core/services/shared_preferences_singleton.dart';
import 'package:weather_app/core/utiles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weather_app/features/home/auth/data/domin/usecase/get_weather_usecase.dart';
import 'package:weather_app/features/home/auth/data/repo_imp/weather_repository_impl.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/fav_cubit/fav_cubit.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/login/presentation/views/widget/splash/splashScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomeBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();

  setup();
  final getWeather = GetWeather(WeatherRepositoryImpl());

  runApp(TennisWeather(getWeather: getWeather));
}

class TennisWeather extends StatelessWidget {
  const TennisWeather({super.key, required this.getWeather});
  final GetWeather getWeather;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WeatherCubit(getWeather),
        ),
        BlocProvider(
          create: (_) => FavoritesCubit(), // Add the FavoritesCubit here
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        primaryColor: Colors.lightGreen, // Change to light green
      ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
