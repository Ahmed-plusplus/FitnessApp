import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../data/repositories/onboarding_repository.dart';
import 'onboarding_state.dart';

class OnboardingViewModel extends Cubit<OnboardingState> {
  final OnboardingRepository _repository;

  OnboardingViewModel(this._repository) : super(const OnboardingState());

  OnboardingStatus get status => state.status;
  String? get errorMessage => state.errorMessage;
  bool get isLoading => state.isLoading;
  bool get isCompleted => state.isCompleted;

  Future<void> completeOnboarding() async {
    if (isLoading) return;

    emit(state.copyWith(
      status: OnboardingStatus.loading,
      clearErrorMessage: true,
    ));

    try {
      await _repository.completeOnboarding();
      emit(state.copyWith(
        status: OnboardingStatus.completed,
        clearErrorMessage: true,
      ));
    } catch (error) {
      final message = error is Failure
          ? error.message
          : 'Something went wrong. Please try again.';
      emit(state.copyWith(
        status: OnboardingStatus.failure,
        errorMessage: message,
      ));
    }
  }
}
