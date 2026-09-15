import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';

class OnboardingAppBar extends StatelessWidget {
  final VoidCallback onPressed;

  const OnboardingAppBar({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.07;

    return SizedBox(
      height: height.clamp(52.0, 64.0),
      child: Row(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.close,
              size: 21,
              color: AppColors.textPrimary,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                AppStrings.appName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}
