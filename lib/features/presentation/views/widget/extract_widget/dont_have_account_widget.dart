import 'package:weather_app/core/utiles/app_color.dart';
import 'package:weather_app/core/utiles/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/presentation/views/widget/sign_up/sign_up_view_body_bloc_consumer.dart';
class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'You don\'t have an account ?',
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
          TextSpan(
            text: ' ',
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xFF616A6B),
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                 Navigator.pushNamed(context, SignUpViewBodyBlocConsumer.routeName);
              },
            text: 'Create Account',
            style:
                TextStyles.semiBold16.copyWith(color: AppColor.gradient2),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
