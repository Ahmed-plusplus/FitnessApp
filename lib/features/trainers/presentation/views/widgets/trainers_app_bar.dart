import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/shared/widgets/app_bar_bottom_divider.dart';
import '../../../../../core/theme/app_colors.dart';

class TrainersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TrainersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final horizontalPadding =
        (screenWidth * 0.055).clamp(16.0, 24.0).toDouble();

    return AppBar(
      centerTitle: false,
      bottom: const AppBarBottomDivider(),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => context.pop(),
      ),
      title: Text(
        AppStrings.trainersTitle,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: horizontalPadding),
          child: Center(
            child: Text(
              AppStrings.appName,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + AppBarBottomDivider.height);
}
