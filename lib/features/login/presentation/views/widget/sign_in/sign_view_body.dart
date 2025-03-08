import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/widgets/custom_text_field.dart';
import 'package:weather_app/core/widgets/custome_button.dart';
import 'package:weather_app/core/widgets/password_field.dart';
import 'package:weather_app/features/login/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:weather_app/features/login/presentation/views/widget/extract_widget/or_divider.dart';
import 'package:weather_app/features/login/presentation/views/widget/extract_widget/register_option.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/images/main_top.png',
                height: 220, // Reduced height
                width: 195, // Reduced width
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 2,
            bottom: 0,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/images/login_bottom.png',
                height: 130, // Reduced height
                width: 180, // Reduced width
                fit: BoxFit.cover,
              ),
            ),
          ),

          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 25),
                    child: Form(
                      key: formKey,
                      autovalidateMode: autovalidateMode,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/sign_in.svg',
                            height: 290, // Reduced size
                          ),
                          const SizedBox(height: 15), // Reduced spacing
                          CustomTextFormField(
                            hintText: 'Email',
                            textInputType: TextInputType.emailAddress,
                            obscureText: false,
                            onSaved: (value) => email = value!,
                          ),
                          const SizedBox(height: 18), // Reduced spacing
                          PasswordField(
                            onSaved: (value) => password = value!,
                          ),
                          const SizedBox(height: 15), // Reduced spacing
                          CustomButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                context.read<SigninCubit>().signin(email, password);
                              } else {
                                setState(() {
                                  autovalidateMode = AutovalidateMode.always;
                                });
                              }
                            },
                            text: 'Sign In',
                          ),
                          const SizedBox(height: 10), // Reduced spacing
                          const OrDivider(),
                          SizedBox(height: screenHeight * 0.015), // Reduced spacing
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () => context.read<SigninCubit>().signinWithGoogle(),
                                  icon: Image.asset(
                                    'assets/images/Google.png',
                                    height: screenHeight * 0.037,
                                     // Slightly reduced
                                  ),
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.04), // Reduced spacing
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () => context.read<SigninCubit>().signinWithFacebook(),
                                  icon: SvgPicture.asset(
                                    'assets/svgs/facebook.svg',
                                    height: screenHeight * 0.037, // Slightly reduced
                                    colorFilter: const ColorFilter.mode(Color.fromARGB(255, 18, 84, 138), BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15), // Reduced spacing
                          const RegisterOption(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
