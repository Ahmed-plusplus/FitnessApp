import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import 'app_badge.dart';
enum AppLevelBadgeStyle { translucent, solidPill }

class AppLevelBadge extends StatelessWidget {
  final String level;
  final AppLevelBadgeStyle style;

  const AppLevelBadge({
    required this.level,
    this.style = AppLevelBadgeStyle.translucent,
    super.key,
  });

  Color get _color {
    switch (level.toLowerCase()) {
      case 'advanced':
        return AppColors.warning;
      case 'beginner':
        return AppColors.success;
      case 'intermediate':
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPill = style == AppLevelBadgeStyle.solidPill;
    final label = Text(
      level.toUpperCase(),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isPill ? AppColors.background : _color,
            fontWeight: FontWeight.w700,
            fontSize: 10,
          ),
    );

    if (isPill) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: label,
      );
    }

    return AppBadge(color: _color, child: label);
  }
}
