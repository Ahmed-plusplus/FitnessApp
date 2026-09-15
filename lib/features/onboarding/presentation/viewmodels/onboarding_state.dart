import 'package:flutter/foundation.dart';

enum OnboardingStatus {
  ready,
  loading,
  completed,
  failure,
}

@immutable
class OnboardingState {
  final OnboardingStatus status;
  final String? errorMessage;

  const OnboardingState({
    this.status = OnboardingStatus.ready,
    this.errorMessage,
  });

  bool get isLoading => status == OnboardingStatus.loading;
  bool get isCompleted => status == OnboardingStatus.completed;

  OnboardingState copyWith({
    OnboardingStatus? status,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return OnboardingState(
      status: status ?? this.status,
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is OnboardingState &&
            other.status == status &&
            other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => Object.hash(status, errorMessage);
}
