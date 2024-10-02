import 'package:flutter/material.dart';
import 'package:weather_app/core/helper_function/build_page.dart';
import 'package:weather_app/core/utiles/app_color.dart';
class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0; // Track the selected index

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        // Body: Display pages using IndexedStack
        Expanded(
          child: IndexedStack(
            index: _selectedIndex,
            children: buildPages(context),
          ),
        ),
        // BottomNavigationBar
        BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColor.PrimaryHomeColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              _selectedIndex = index; // Update the index and rebuild the widget
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.sunny),
              label: 'Weather',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'Check',
            ),
          ],
        ),
      ],
    );
  }
}