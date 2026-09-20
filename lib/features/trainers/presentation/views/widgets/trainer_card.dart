import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/shared/models/trainers_model.dart';
import '../../../../../core/shared/widgets/app_badge.dart';
import '../../../../../core/shared/widgets/app_thumbnail_image.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_theme.dart';

class TrainerCard extends StatelessWidget {
  final TrainersModel trainer;
  final VoidCallback? onViewProfile;

  const TrainerCard({required this.trainer, this.onViewProfile, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: AppUi.trainerCardHeight,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppUi.trainerCardRadius),
          side: const BorderSide(color: AppColors.border),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppUi.trainerCardHorizontalPadding,
            vertical: AppUi.trainerCardVerticalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppThumbnailImage(
                imageUrl: trainer.image,
                width: AppUi.trainerCardImageSize,
                height: AppUi.trainerCardImageSize,
              ),
              const SizedBox(width: AppUi.cardTextGap),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            trainer.name ?? '',
                            style: textTheme.titleMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (trainer.rating != null)
                          _RatingBadge(rating: trainer.rating!),
                      ],
                    ),
                    if (trainer.specialty != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        trainer.specialty!,
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    if (trainer.experienceYears != null) ...[
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 14,
                            color: AppColors.textMuted,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${trainer.experienceYears} '
                            '${AppStrings.yearsExperienceSuffix}',
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 6),
                    OutlinedButton(
                      onPressed: onViewProfile,
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppStrings.viewProfile,
                            style: textTheme.bodySmall,
                          ),
                          const SizedBox(width: 2),
                          const Icon(Icons.chevron_right, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  final double rating;

  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return AppBadge(
      color: AppColors.primary,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, size: 12, color: AppColors.primary),
          const SizedBox(width: 3),
          Text(
            rating.toStringAsFixed(1),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
          ),
        ],
      ),
    );
  }
}
