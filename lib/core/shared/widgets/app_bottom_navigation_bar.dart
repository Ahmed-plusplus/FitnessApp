import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_assets.dart';
import '../../route/app_routes.dart';
import '../../theme/app_colors.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const AppBottomNavigationBar({required this.currentIndex, super.key});

  static const items = [
    _NavigationItem(assetPath: AppAssets.homeIcon, label: 'Home'),
    _NavigationItem(assetPath: AppAssets.trainersIcon, label: 'Trainers'),
    _NavigationItem(assetPath: AppAssets.plansIcon, label: 'Plans'),
    _NavigationItem(assetPath: AppAssets.favoritesIcon, label: 'Favorites'),
    _NavigationItem(assetPath: AppAssets.profileIcon, label: 'Profile'),
  ];

  void onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    if (index == 0) {
      context.go(AppRoutes.home);
    } else if (index == 1) {
      context.go(AppRoutes.trainers);
    } else if (index == 2) {
      context.go(AppRoutes.plans);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => onItemTapped(context, index),
      items: [
        for (var i = 0; i < items.length; i++)
          BottomNavigationBarItem(
            icon: _NavIcon(
              assetPath: items[i].assetPath,
              isSelected: i == currentIndex,
            ),
            label: items[i].label,
          ),
      ],
    );
  }
}

class _NavIcon extends StatelessWidget {
  final String assetPath;
  final bool isSelected;

  const _NavIcon({required this.assetPath, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(
        isSelected ? AppColors.primary : AppColors.textSecondary,
        BlendMode.srcIn,
      ),
    );
  }
}

class _NavigationItem {
  final String assetPath;
  final String label;

  const _NavigationItem({required this.assetPath, required this.label});
}
