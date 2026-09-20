import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/shared/models/plans_model.dart';
import '../../../../../core/shared/widgets/app_level_badge.dart';
import '../../../../../core/shared/widgets/app_thumbnail_image.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_theme.dart';

class PlanCard extends StatelessWidget {
  final PlansModel plan;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onTap;

  const PlanCard({required this.plan, required this.isFavorite, required this.onFavoriteToggle, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: AppUi.cardHeight,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppUi.cardPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppThumbnailImage(imageUrl: plan.image, width: AppUi.cardImageWidth, height: AppUi.cardImageHeight),
                const SizedBox(width: AppUi.cardTextGap),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (plan.level != null) AppLevelBadge(level: plan.level!),

                          const Spacer(),

                          IconButton(
                            onPressed: onFavoriteToggle,
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                            icon: SvgPicture.asset(
                              AppAssets.favoritesIcon,
                              width: 20,
                              height: 20,
                              colorFilter: ColorFilter.mode(isFavorite ? AppColors.primary : AppColors.textMuted, BlendMode.srcIn),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 4),

                      Text(plan.name ?? '', style: textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),

                      const SizedBox(height: 4),

                      if (plan.description != null)
                        Text(plan.description!, style: textTheme.bodyMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
