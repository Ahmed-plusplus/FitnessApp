import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/shared/models/plans_model.dart';
import '../../../../../core/shared/widgets/app_badge.dart';
import '../../../../../core/shared/widgets/app_thumbnail_image.dart';
import '../../../../../core/theme/app_colors.dart';

class PlanCard extends StatelessWidget {
  final PlansModel plan;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  const PlanCard({
    required this.plan,
    required this.isFavorite,
    required this.onFavoriteToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final imageWidth = (screenWidth * 0.23).clamp(76.0, 96.0).toDouble();
    final imageHeight = imageWidth * 1.14;
    final cardPadding = (screenWidth * 0.03).clamp(10.0, 14.0).toDouble();
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppThumbnailImage(
              imageUrl: plan.image,
              width: imageWidth,
              height: imageHeight,
            ),
            SizedBox(width: screenWidth * 0.035),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (plan.level != null) _LevelBadge(level: plan.level!),
                      const Spacer(),
                      IconButton(
                        onPressed: onFavoriteToggle,
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        icon: SvgPicture.asset(
                          AppAssets.favoritesIcon,
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            isFavorite
                                ? AppColors.primary
                                : AppColors.textMuted,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    plan.name ?? '',
                    style: textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  if (plan.description != null)
                    Text(
                      plan.description!,
                      style: textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LevelBadge extends StatelessWidget {
  final String level;

  const _LevelBadge({required this.level});

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
    return AppBadge(
      color: _color,
      child: Text(
        level.toUpperCase(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: _color,
              fontWeight: FontWeight.w700,
              fontSize: 10,
            ),
      ),
    );
  }
}
