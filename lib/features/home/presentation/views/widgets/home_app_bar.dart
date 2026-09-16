import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/shared/widgets/app_bar_bottom_divider.dart';
import '../../../../../core/theme/app_colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final horizontalPadding =
        (screenWidth * 0.055).clamp(16.0, 24.0).toDouble();

    return AppBar(
      titleSpacing: horizontalPadding,
      bottom: const AppBarBottomDivider(),
      title: Row(
        children: [
          const Icon(Icons.bolt, color: AppColors.primary, size: 22),
          SizedBox(width: screenWidth * 0.02),
          Text(
            AppStrings.appName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: horizontalPadding),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(
                AppAssets.notificationIcon,
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.textPrimary,
                  BlendMode.srcIn,
                ),
              ),
              Positioned(
                top: -1,
                right: -1,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + AppBarBottomDivider.height);
}
