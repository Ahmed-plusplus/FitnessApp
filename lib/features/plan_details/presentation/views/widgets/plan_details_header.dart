import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/shared/widgets/app_badge.dart';
import '../../../../../core/shared/widgets/app_thumbnail_image.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../data/models/plan_details_model.dart';

class PlanDetailsHeader extends StatelessWidget {
  final PlanDetailsModel plan;

  const PlanDetailsHeader({required this.plan, super.key});

  static const EdgeInsets _badgePadding =
      EdgeInsets.symmetric(horizontal: 8, vertical: 4);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final imageHeight = (screenWidth * 0.62).clamp(200.0, 320.0).toDouble();
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppThumbnailImage(
          imageUrl: plan.image,
          width: double.infinity,
          height: imageHeight,
          borderRadius: 16,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            AppBadge(
              color: AppColors.primary,
              filled: true,
              padding: _badgePadding,
              child: _BadgeLabel(label: plan.level, color: AppColors.white),
            ),
            const SizedBox(width: 8),
            AppBadge(
              color: AppColors.card,
              filled: true,
              padding: _badgePadding,
              child: _BadgeLabel(
                label: '${plan.durationWeeks} ${AppStrings.weeks}',
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(plan.name, style: textTheme.headlineMedium),
        const SizedBox(height: 8),
        Text(plan.description, style: textTheme.bodyMedium),
      ],
    );
  }
}

class _BadgeLabel extends StatelessWidget {
  final String label;
  final Color color;

  const _BadgeLabel({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
            fontSize: 10,
            letterSpacing: 0.8,
          ),
    );
  }
}
