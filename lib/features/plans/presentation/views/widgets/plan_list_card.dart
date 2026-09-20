import 'package:flutter/material.dart';

import '../../../../../core/shared/models/plans_model.dart';
import '../../../../../core/shared/widgets/app_level_badge.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_theme.dart';

class PlanListCard extends StatelessWidget {
  final PlansModel plan;
  final VoidCallback? onTap;

  const PlanListCard({required this.plan, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 10,
                  child: plan.image == null
                      ? Container(color: AppColors.surface)
                      : Image.network(
                          plan.image!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              Container(color: AppColors.surface),
                        ),
                ),
                if (plan.level != null)
                  Positioned(
                      top: AppUi.cardPadding,
                      right: AppUi.cardPadding,
                    child: AppLevelBadge(
                      level: plan.level!,
                      style: AppLevelBadgeStyle.solidPill,
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppUi.cardPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan.name ?? '',
                    style: textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (plan.durationWeeks != null) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 14,
                          color: AppColors.textMuted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${plan.durationWeeks} Weeks',
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
