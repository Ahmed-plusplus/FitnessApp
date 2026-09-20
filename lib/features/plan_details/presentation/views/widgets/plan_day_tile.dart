import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../data/models/plan_day_model.dart';
import '../../../data/models/plan_exercise_model.dart';

class PlanDayTile extends StatelessWidget {
  final PlanDayModel day;
  final bool isExpanded;
  final VoidCallback onToggle;

  const PlanDayTile({
    required this.day,
    required this.isExpanded,
    required this.onToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (day.isRestDay) return _RestDayTile(day: day);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          InkWell(
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(child: _DayTitle(day: day)),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.chevron_right,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.topCenter,
            child: isExpanded
                ? _ExerciseList(exercises: day.exercises)
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}

class _DayTitle extends StatelessWidget {
  final PlanDayModel day;
  final Color labelColor;
  final Color? titleColor;

  const _DayTitle({
    required this.day,
    this.labelColor = AppColors.primary,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${AppStrings.day} ${day.number}'.toUpperCase(),
          style: textTheme.bodySmall?.copyWith(
            color: labelColor,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          day.title,
          style: textTheme.titleMedium?.copyWith(color: titleColor),
        ),
      ],
    );
  }
}

class _RestDayTile extends StatelessWidget {
  final PlanDayModel day;

  const _RestDayTile({required this.day});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: _DayTitle(
                day: day,
                labelColor: AppColors.textMuted,
                titleColor: AppColors.textMuted,
              ),
            ),
            const Icon(Icons.hotel_outlined, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}

class _ExerciseList extends StatelessWidget {
  final List<PlanExerciseModel> exercises;

  const _ExerciseList({required this.exercises});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            for (var i = 0; i < exercises.length; i++) ...[
              if (i > 0) const SizedBox(height: 12),
              _ExerciseTile(exercise: exercises[i]),
            ],
          ],
        ),
      ),
    );
  }
}

class _ExerciseTile extends StatelessWidget {
  final PlanExerciseModel exercise;

  const _ExerciseTile({required this.exercise});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(
            Icons.fitness_center_outlined,
            color: AppColors.textMuted,
            size: 18,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exercise.name,
                style: textTheme.titleMedium?.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 2),
              Text(
                '${exercise.sets} ${AppStrings.sets} × '
                '${exercise.reps} ${AppStrings.reps}',
                style: textTheme.bodySmall?.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
