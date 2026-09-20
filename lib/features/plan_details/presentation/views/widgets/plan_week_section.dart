import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../data/models/plan_week_model.dart';
import 'plan_day_tile.dart';

class PlanWeekSection extends StatelessWidget {
  final PlanWeekModel week;
  final Set<int> expandedDayNumbers;
  final ValueChanged<int> onToggleDay;

  const PlanWeekSection({
    required this.week,
    required this.expandedDayNumbers,
    required this.onToggleDay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '${AppStrings.week} ${week.number}: ${week.title}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
              },
              child: Text(
                AppStrings.viewAllWeeks,
                style: textTheme.bodyLarge?.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        for (final day in week.days) ...[
          PlanDayTile(
            day: day,
            isExpanded: expandedDayNumbers.contains(day.number),
            onToggle: () => onToggleDay(day.number),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}
