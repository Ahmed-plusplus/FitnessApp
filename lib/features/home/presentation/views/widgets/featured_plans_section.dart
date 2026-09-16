import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/shared/models/plans_model.dart';
import '../../../../../core/shared/widgets/app_entity_list_view.dart';
import '../../../../../core/theme/app_colors.dart';
import 'plan_card.dart';

class FeaturedPlansSection extends StatelessWidget {
  final List<PlansModel> plans;
  final Set<int> favoritePlanIds;
  final ValueChanged<int> onToggleFavorite;

  const FeaturedPlansSection({
    required this.plans,
    required this.favoritePlanIds,
    required this.onToggleFavorite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.featuredWorkoutPlans,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextButton(
              onPressed: () {
                // feature is built.
              },
              child: Text(
                AppStrings.seeAll,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primary,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        AppEntityListView<PlansModel>(
          items: plans,
          emptyMessage: AppStrings.noFeaturedPlans,
          itemBuilder: (context, plan) => PlanCard(
            plan: plan,
            isFavorite: favoritePlanIds.contains(plan.id),
            onFavoriteToggle:
                plan.id == null ? null : () => onToggleFavorite(plan.id!),
          ),
        ),
      ],
    );
  }
}
