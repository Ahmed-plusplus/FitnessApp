import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../data/models/plan_details_model.dart';

class PlanStatsRow extends StatelessWidget {
  final PlanDetailsModel plan;

  const PlanStatsRow({required this.plan, super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _StatCard(
              icon: Icons.timer_outlined,
              label: AppStrings.durationLabel,
              value: '${plan.minSessionMinutes}-${plan.maxSessionMinutes}m',
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatCard(
              icon: Icons.repeat,
              label: AppStrings.frequencyLabel,
              value: '${plan.daysPerWeek} ${AppStrings.daysPerWeekSuffix}',
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatCard(
              icon: Icons.local_fire_department_outlined,
              label: AppStrings.intensityLabel,
              value: plan.intensity,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primary, size: 20),
            const SizedBox(height: 6),
            Text(label, style: textTheme.bodySmall),
            const SizedBox(height: 2),
            Text(
              value,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
