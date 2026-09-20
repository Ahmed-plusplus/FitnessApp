import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_strings.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';
import 'app_bar_bottom_divider.dart';

class AppBrandedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showNotificationDot;

  const AppBrandedAppBar({this.showNotificationDot = false, super.key});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = AppUi.horizontalPadding(context);

    return AppBar(
      titleSpacing: horizontalPadding,
      bottom: const AppBarBottomDivider(),
      title: Row(
        children: [
          const Icon(Icons.bolt, color: AppColors.primary, size: 25),
          const SizedBox(width: AppUi.contentGap),
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
              if (showNotificationDot)
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
