import 'package:weather_app/core/utiles/strings.dart';

class OnboardingContent {
  final String image;
  final String title;
  final String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

// Sample onboarding data
List<OnboardingContent> contents = [
  OnboardingContent(
    image: AppStrings.FirstImageInOnBoarding,
    title: AppStrings.FirstTitleInOnBoarding,
    description: AppStrings.FirstDescriptionInOnBoarding,
  ),
  OnboardingContent(
    image: AppStrings.SecondImageInOnBoarding,
    title: AppStrings.SecondTitleInOnBoarding,
    description: AppStrings.SecondDescriptionInOnBoarding,
  ),
  OnboardingContent(
    image: AppStrings.ThirdImageInOnBoarding,
    title: AppStrings.ThirdTitleInOnBoarding,
    description: AppStrings.ThirdDescriptionInOnBoarding,
  ),
];