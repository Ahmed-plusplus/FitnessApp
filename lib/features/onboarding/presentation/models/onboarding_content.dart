import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';

class OnboardingContent {
  final String image;
  final String title;
  final String description;
  final String buttonText;

  const OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
    required this.buttonText,
  });

  static const OnboardingContent welcome = OnboardingContent(
    image: AppAssets.onboarding,
    title: AppStrings.welcomeTitle,
    description: AppStrings.welcomeDescription,
    buttonText: AppStrings.getStarted,
  );
}
