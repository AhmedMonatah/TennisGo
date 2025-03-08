import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/utiles/strings.dart';
import 'package:weather_app/features/login/presentation/views/widget/sign_up/signup_view.dart';

class RegisterOption extends StatelessWidget {
  const RegisterOption({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SignupView.routeName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.registerOption,
            style:GoogleFonts.ubuntu(
                textStyle:const TextStyle(color: Colors.black)
            ) ,
          ),
           Text(
            AppStrings.registerOption2,
            style:GoogleFonts.ubuntu(
                textStyle:const TextStyle(color: Colors.green)
            ) ,
          ),
        ],
      ),
    );
  }
}
