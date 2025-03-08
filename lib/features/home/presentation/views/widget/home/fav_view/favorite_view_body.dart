import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utiles/strings.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/fav_cubit/fav_cubit.dart';

class FavoriteViewBody extends StatefulWidget {
  const FavoriteViewBody({super.key});

  @override
  _FavoriteViewBodyState createState() => _FavoriteViewBodyState();
}

class _FavoriteViewBodyState extends State<FavoriteViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Animation duration
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward(); // Start animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: BlocBuilder<FavoritesCubit, List<String>>(
        builder: (context, favCities) {
          if (favCities.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_border, size: 80, color: Colors.yellowAccent),
                  SizedBox(height: 10),
                  Text(
                    AppStrings.NoFavorites,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favCities.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(favCities[index]),
                direction: DismissDirection.endToStart,
                background: Container(
                  padding: const EdgeInsets.only(right: 20),
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.delete, color: Colors.white, size: 30),
                ),
                onDismissed: (direction) {
                  BlocProvider.of<FavoritesCubit>(context)
                      .toggleFavorite(favCities[index]);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 6,
                  color: Colors.blueGrey[900],
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    leading: const Icon(Icons.location_city,
                        color: Colors.white, size: 30),
                    title: Text(
                      favCities[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite,
                          color: Colors.yellowAccent),
                      onPressed: () {
                        BlocProvider.of<FavoritesCubit>(context)
                            .toggleFavorite(favCities[index]);
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
