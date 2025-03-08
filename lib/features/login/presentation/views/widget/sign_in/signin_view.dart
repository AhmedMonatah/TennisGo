import 'package:weather_app/core/services/get_it_services.dart';
import 'package:weather_app/core/utiles/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/login/auth/data/domin/repos/auth_repos.dart';
import 'package:weather_app/features/login/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:weather_app/features/login/presentation/views/widget/sign_in/signin_view_body_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  static const routeName = Klogin;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getit.get<AuthRepo>(),
      ),
      child: Scaffold(
        body: const SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
