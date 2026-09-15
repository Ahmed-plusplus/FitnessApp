import 'package:flutter/material.dart';

import '../../models/onboarding_content.dart';
import '../../viewmodels/onboarding_view_model.dart';
import '../../../../../core/theme/app_colors.dart';

class OnboardingActionButton extends StatelessWidget {
  final OnboardingContent content;
  final OnboardingViewModel viewModel;

  const OnboardingActionButton({
    required this.content,
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) {
        return SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: viewModel.isLoading
                ? null
                : viewModel.completeOnboarding,
            child: viewModel.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.white,
                    ),
                  )
                : Text(content.buttonText),
          ),
        );
      },
    );
  }
}
