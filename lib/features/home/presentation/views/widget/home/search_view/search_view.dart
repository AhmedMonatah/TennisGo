import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/search_view/search_view_body.dart';

class SearchView extends StatelessWidget {

  const SearchView({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Color.fromRGBO(200,239,216 ,1)),
      backgroundColor:Color.fromRGBO(200,239,216 ,1), // dark blue background
      body: const SearchViewBody(),
      
    );
  }
}