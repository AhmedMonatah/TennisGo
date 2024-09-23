import 'package:weather_app/core/helper_function/build_error_bar.dart';
import 'package:weather_app/core/utiles/app_color.dart';
import 'package:weather_app/features/login/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
              content: Text('Sign-up successful!'),
              backgroundColor: AppColor.gradient2,
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
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
