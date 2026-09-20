import 'package:flutter/foundation.dart';

import '../../../../core/shared/models/plans_model.dart';

enum PlansStatus {
  initial,
  loading,
  loaded,
  failure,
}

@immutable
class PlansState {
  final PlansStatus status;
  final List<PlansModel> plans;
  final String? errorMessage;

  const PlansState({
    this.status = PlansStatus.initial,
    this.plans = const [],
    this.errorMessage,
  });

  bool get isLoading => status == PlansStatus.loading;
  bool get isLoaded => status == PlansStatus.loaded;

  PlansState copyWith({
    PlansStatus? status,
    List<PlansModel>? plans,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return PlansState(
      status: status ?? this.status,
      plans: plans ?? this.plans,
      errorMessage:
          clearErrorMessage ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PlansState &&
            other.status == status &&
            listEquals(other.plans, plans) &&
            other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => Object.hash(
        status,
        Object.hashAll(plans),
        errorMessage,
      );
}
