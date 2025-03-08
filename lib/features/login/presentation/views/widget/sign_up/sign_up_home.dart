import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/helper_function/build_error_bar.dart';
import 'package:weather_app/core/utiles/strings.dart';
import 'package:weather_app/core/widgets/custom_text_field.dart';
import 'package:weather_app/core/widgets/custome_button.dart';
import 'package:weather_app/core/widgets/password_field.dart';
import 'package:weather_app/features/login/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:weather_app/features/login/presentation/views/widget/extract_widget/have_an_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/login/presentation/views/widget/extract_widget/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, userName, password;
  late bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Top-left background image
        Positioned(
          left: 0,
          top: 0,
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(
              AppStrings.SignupMainTopImage,
              height: 220,
              width: 195,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Bottom-right background image
        Positioned(
          right: 2,
          bottom: 0,
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(
              AppStrings.SignupMainBottomImage,
              height: 130,
              width: 180,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Signup Content without extra bottom space
        Container(
          height: screenHeight, // Restricts the layout height
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 25),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(), // Prevents overscroll
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Avoid extra space
                children: [
                  // Signup Illustration
                  SvgPicture.asset(
                    AppStrings.SignupImage,
                    height: 250,
                  ),
                  const SizedBox(height: 20),

                  // Full Name Field
                  CustomTextFormField(
                    onSaved: (value) {
                      userName = value!;
                    },
                    hintText: AppStrings.SignupHintName,
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 14),

                  // Email Field
                  CustomTextFormField(
                    onSaved: (value) {
                      email = value!;
                    },
                    hintText: AppStrings.SignupHintEmail,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 14),

                  // Password Field
                  PasswordField(
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                  const SizedBox(height: 14),

                  // Terms and Conditions
                  TermsAndConditionsWidget(
                    onChanged: (value) {
                      isTermsAccepted = value;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Create Account Button
                  CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (isTermsAccepted) {
                          context.read<SignupCubit>()
                              .createUserWithEmailAndPassword(email, password, userName);
                        } else {
                          buildErrorBar(context, AppStrings.SignupAcceptTerms);
                        }
                      }
                    },
                    text: AppStrings.SignupCreateAccount,
                  ),
                  const SizedBox(height: 20), // Reduced space

                  // Already have an account? Sign in
                  const HaveAnAccountWidget(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
