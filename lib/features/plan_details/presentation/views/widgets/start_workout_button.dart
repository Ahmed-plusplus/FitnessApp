import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_theme.dart';

class StartWorkoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const StartWorkoutButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = AppUi.horizontalPadding(context);

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          horizontalPadding,
          12,
          horizontalPadding,
          16,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.primaryCtaRadius),
            boxShadow: AppTheme.primaryCtaGlow,
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: AppTheme.primaryCtaButton,
            child: Text(AppStrings.startWorkout.toUpperCase()),
          ),
        ),
      ),
    );
  }
}
