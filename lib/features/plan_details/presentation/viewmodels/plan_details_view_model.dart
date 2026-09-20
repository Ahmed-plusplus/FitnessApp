import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/plan_details_model.dart';
import '../../data/repositories/plan_details_repository.dart';
import 'plan_details_state.dart';

class PlanDetailsViewModel extends Cubit<PlanDetailsState> {
  final PlanDetailsRepository _repository;

  PlanDetailsViewModel(this._repository) : super(const PlanDetailsState());

  Future<void> loadPlan(int planId) async {
    emit(state.copyWith(
      status: PlanDetailsStatus.loading,
      clearErrorMessage: true,
    ));

    try {
      final plan = await _repository.getPlanDetails(planId);
      final isFavorite = await _repository.isPlanFavorite(planId);

      emit(state.copyWith(
        status: PlanDetailsStatus.loaded,
        plan: plan,
        isFavorite: isFavorite,
        expandedDayNumbers: _initiallyExpandedDays(plan),
        clearErrorMessage: true,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: PlanDetailsStatus.failure,
        errorMessage: _messageFor(error),
      ));
    }
  }

  Future<void> toggleFavorite() async {
    final plan = state.plan;
    if (plan == null) return;

    try {
      final isFavorite = await _repository.toggleFavoritePlan(plan.id);
      emit(state.copyWith(isFavorite: isFavorite, clearErrorMessage: true));
    } catch (error) {
      emit(state.copyWith(errorMessage: _messageFor(error)));
    }
  }

  void toggleDay(int dayNumber) {
    final expandedDays = {...state.expandedDayNumbers};
    if (!expandedDays.remove(dayNumber)) {
      expandedDays.add(dayNumber);
    }
    emit(state.copyWith(expandedDayNumbers: expandedDays));
  }

  Set<int> _initiallyExpandedDays(PlanDetailsModel plan) {
    final firstWeek = plan.weeks.firstOrNull;
    if (firstWeek == null) return const {};

    final firstWorkoutDay =
        firstWeek.days.where((day) => !day.isRestDay).firstOrNull;
    return firstWorkoutDay == null ? const {} : {firstWorkoutDay.number};
  }

  String _messageFor(Object error) {
    return error is Failure ? error.message : AppStrings.somethingWentWrong;
  }
}
