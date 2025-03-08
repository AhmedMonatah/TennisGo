import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/utiles/app_color.dart';
import 'package:weather_app/core/utiles/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Do you have an account? ',
            style:GoogleFonts.ubuntu(textStyle:TextStyles.semiBold16.copyWith(
              color: AppColor.CondtionInSign,
            ), ) 
          ),
          TextSpan(
            text: ' ',
            style: TextStyles.semiBold16.copyWith(
              color: AppColor.CondtionInSign,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
            text: 'Sign In',
            style:
                TextStyles.semiBold16.copyWith(color: AppColor.LightPrimaryColor),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
