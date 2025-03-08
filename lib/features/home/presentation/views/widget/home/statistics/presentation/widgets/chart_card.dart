import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget chart;

  const ChartCard({Key? key, required this.title, required this.icon, required this.chart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(height: 200, child: chart),
          ],
        ),
      ),
    );
  }
}
