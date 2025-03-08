import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/utiles/strings.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
       const Expanded(
          child: Divider(
            endIndent: 5,
            indent: 35,
            color: Color(0xFFDCDEDE),
          ),
        ),
        const SizedBox(
          width: 0,
        ),
        Text(
          AppStrings.orLoginWith,
          textAlign: TextAlign.center,
          style:GoogleFonts.ubuntu(textStyle:const TextStyle(color: Colors.black) ) ,
        ),
       const SizedBox(
          width: 3,
        ),
       const Expanded(
          child: Divider(
            endIndent: 35,
            color: Color(0xFFDCDEDE),
          ),
        ),
      ],
    );
  }
}
