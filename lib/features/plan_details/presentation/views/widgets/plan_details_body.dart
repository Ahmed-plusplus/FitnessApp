import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../data/models/plan_details_model.dart';
import '../../../data/models/plan_week_model.dart';
import '../../viewmodels/plan_details_state.dart';
import '../../viewmodels/plan_details_view_model.dart';
import 'plan_details_header.dart';
import 'plan_stats_row.dart';
import 'plan_week_section.dart';
import 'start_workout_button.dart';

class PlanDetailsBody extends StatelessWidget {
  final Future<void> Function() onRetry;
  final ValueChanged<int> onToggleDay;
  final VoidCallback onStartWorkout;

  const PlanDetailsBody({
    required this.onRetry,
    required this.onToggleDay,
    required this.onStartWorkout,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = AppUi.horizontalPadding(context);

    return BlocBuilder<PlanDetailsViewModel, PlanDetailsState>(
      builder: (context, state) {
        final plan = state.plan;

        if (plan == null && state.status == PlanDetailsStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: onRetry,
          child: plan == null
              ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 120),
                  children: [
                    Text(
                      state.errorMessage ?? AppStrings.somethingWentWrong,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                )
              : _PlanContent(
                  plan: plan,
                  week: state.currentWeek,
                  expandedDayNumbers: state.expandedDayNumbers,
                  horizontalPadding: horizontalPadding,
                  onToggleDay: onToggleDay,
                  onStartWorkout: onStartWorkout,
                ),
        );
      },
    );
  }
}

class _PlanContent extends StatelessWidget {
  final PlanDetailsModel plan;
  final PlanWeekModel? week;
  final Set<int> expandedDayNumbers;
  final double horizontalPadding;
  final ValueChanged<int> onToggleDay;
  final VoidCallback onStartWorkout;

  const _PlanContent({
    required this.plan,
    required this.week,
    required this.expandedDayNumbers,
    required this.horizontalPadding,
    required this.onToggleDay,
    required this.onStartWorkout,
  });

  @override
  Widget build(BuildContext context) {
    final week = this.week;

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              16,
              horizontalPadding,
              24,
            ),
            children: [
              PlanDetailsHeader(plan: plan),
              const SizedBox(height: 20),
              PlanStatsRow(plan: plan),
              const SizedBox(height: 24),
              if (week == null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    AppStrings.noPlanWorkouts,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              else
                PlanWeekSection(
                  week: week,
                  expandedDayNumbers: expandedDayNumbers,
                  onToggleDay: onToggleDay,
                ),
            ],
          ),
        ),
        StartWorkoutButton(onPressed: onStartWorkout),
      ],
    );
  }
}
