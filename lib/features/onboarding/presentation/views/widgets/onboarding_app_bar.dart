import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';

class OnboardingAppBar extends StatelessWidget {
  const OnboardingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close, size: 21, color: AppColors.textPrimary),
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
