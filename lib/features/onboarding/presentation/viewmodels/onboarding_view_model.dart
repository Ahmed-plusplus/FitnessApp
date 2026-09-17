import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../domain/usecases/complete_onboarding_usecase.dart';
import 'onboarding_state.dart';

/// MVVM ViewModel and Cubit for the onboarding presentation layer.
///
/// The View keeps depending on the ViewModel, while Cubit provides the
/// reactive state stream consumed by the Flutter UI.
class OnboardingViewModel extends Cubit<OnboardingState> {
  final CompleteOnboardingUseCase _completeOnboardingUseCase;

  OnboardingViewModel(this._completeOnboardingUseCase)
      : super(const OnboardingState());

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
      await _completeOnboardingUseCase();
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
