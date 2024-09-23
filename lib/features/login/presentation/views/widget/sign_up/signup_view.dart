import 'package:weather_app/core/services/get_it_services.dart';
import 'package:weather_app/core/widgets/custome_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/login/auth/data/domin/repos/auth_repos.dart';
import 'package:weather_app/features/login/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:weather_app/features/login/presentation/views/widget/sign_up/sign_up_view_body_bloc_consumer.dart';
class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getit<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: BuildAppBar(context, title: 'New Account'),
        body: const SignUpViewBodyBlocConsumer(),
      ),
    );
  }
}
