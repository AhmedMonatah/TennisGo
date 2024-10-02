import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/manger/cubits/fav_cubit/fav_cubit.dart';

class FavoriteViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, List<String>>(
      builder: (context, favCities) {
        if (favCities.isEmpty) {
          return const Center(
            child: Text(
              'No cities favorited yet.',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        }

        return ListView.builder(
          itemCount: favCities.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top:100),
              child: ListTile(
                title: Text(
                  favCities[index],
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    BlocProvider.of<FavoritesCubit>(context)
                        .toggleFavorite(favCities[index]);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
