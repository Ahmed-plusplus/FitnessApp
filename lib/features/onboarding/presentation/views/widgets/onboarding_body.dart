import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../models/onboarding_content.dart';
import '../../viewmodels/onboarding_view_model.dart';
import 'onboarding_action_button.dart';

class OnboardingBody extends StatelessWidget {
  final OnboardingContent content;
  final OnboardingViewModel viewModel;
  final double imageHeight;

  const OnboardingBody({
    required this.content,
    required this.viewModel,
    required this.imageHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final titleFontSize = (screenSize.width * 0.075).clamp(24.0, 30.0).toDouble();
    final bodyFontSize = (screenSize.width * 0.045).clamp(14.0, 18.0).toDouble();
    final sectionSpacing = (screenSize.height * 0.02).clamp(16.0, 26.0).toDouble();
    final indicatorWidth =
        (screenSize.width * 0.3).clamp(90.0, 120.0).toDouble();
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Image.asset(
          content.image,
          width: double.infinity,
          height: imageHeight,
          fit: BoxFit.cover,
        ),
        SizedBox(height: sectionSpacing),
        Text(
          content.title,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium?.copyWith(
            fontSize: titleFontSize,
            height: 1.15,
          ),
        ),
        SizedBox(height: sectionSpacing * 0.65),
        Text(
          content.description,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(
            fontSize: bodyFontSize,
            height: 1.6,
          ),
        ),
        SizedBox(height: sectionSpacing),
        OnboardingActionButton(
          content: content,
          viewModel: viewModel,
        ),
        SizedBox(height: sectionSpacing * 0.8),
        Container(
          width: indicatorWidth,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.border,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
