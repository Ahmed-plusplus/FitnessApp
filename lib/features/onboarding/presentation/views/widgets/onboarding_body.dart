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
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Image.asset(
          content.image,
          width: double.infinity,
          height: imageHeight,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 24),
        Text(
          content.title,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium?.copyWith(
            fontSize: 26,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          content.description,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 26),
        OnboardingActionButton(
          content: content,
          viewModel: viewModel,
        ),
        const SizedBox(height: 20),
        Container(
          width: 104,
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
