import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/onboarding_content.dart';
import '../../viewmodels/onboarding_state.dart';
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
    final buttonHeight =
        (MediaQuery.sizeOf(context).height * 0.06).clamp(44.0, 52.0).toDouble();

    return BlocBuilder<OnboardingViewModel, OnboardingState>(
      bloc: viewModel,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: buttonHeight,
          child: ElevatedButton(
            onPressed: state.isLoading
                ? null
                : viewModel.completeOnboarding,
            child: state.isLoading
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
