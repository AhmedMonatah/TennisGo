import 'package:weather_app/core/helper_function/build_error_bar.dart';
import 'package:weather_app/core/utiles/app_color.dart';
import 'package:weather_app/core/utiles/strings.dart';
import 'package:weather_app/core/widgets/loading_page_effects.dart';
import 'package:weather_app/features/login/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/login/presentation/views/widget/sign_up/sign_up_home.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});
  
  static const String routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          // Show a success snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(AppStrings.SignupSuccess),
              backgroundColor: AppColor.LightPrimaryColor,
            ),
          );

          // Navigate after showing the snackbar
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pop(context);
          });
        }

        if (state is SignupFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            const SignupViewBody(), // Main UI
            if (state is SignupLoading) const RotatingLoadingWidget(), // Show loader when loading
          ],
        );
      },
    );
  }
}
