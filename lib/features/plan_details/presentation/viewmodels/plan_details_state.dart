import 'package:flutter/foundation.dart';

import '../../data/models/plan_details_model.dart';
import '../../data/models/plan_week_model.dart';

enum PlanDetailsStatus {
  initial,
  loading,
  loaded,
  failure,
}

@immutable
class PlanDetailsState {
  final PlanDetailsStatus status;
  final PlanDetailsModel? plan;
  final bool isFavorite;
  final Set<int> expandedDayNumbers;
  final String? errorMessage;

  const PlanDetailsState({
    this.status = PlanDetailsStatus.initial,
    this.plan,
    this.isFavorite = false,
    this.expandedDayNumbers = const {},
    this.errorMessage,
  });

  bool get isLoading => status == PlanDetailsStatus.loading;
  bool get isLoaded => status == PlanDetailsStatus.loaded;

  PlanWeekModel? get currentWeek => plan?.weeks.firstOrNull;

  bool isDayExpanded(int dayNumber) => expandedDayNumbers.contains(dayNumber);

  PlanDetailsState copyWith({
    PlanDetailsStatus? status,
    PlanDetailsModel? plan,
    bool? isFavorite,
    Set<int>? expandedDayNumbers,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return PlanDetailsState(
      status: status ?? this.status,
      plan: plan ?? this.plan,
      isFavorite: isFavorite ?? this.isFavorite,
      expandedDayNumbers: expandedDayNumbers ?? this.expandedDayNumbers,
      errorMessage:
          clearErrorMessage ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PlanDetailsState &&
            other.status == status &&
            other.plan == plan &&
            other.isFavorite == isFavorite &&
            setEquals(other.expandedDayNumbers, expandedDayNumbers) &&
            other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => Object.hash(
        status,
        plan,
        isFavorite,
        Object.hashAll(expandedDayNumbers),
        errorMessage,
      );
}
