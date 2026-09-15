import 'package:flutter/foundation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/usecases/complete_onboarding_usecase.dart';

enum OnboardingStatus {
  ready,
  loading,
  completed,
  failure,
}

class OnboardingViewModel extends ChangeNotifier {
  final CompleteOnboardingUseCase _completeOnboardingUseCase;

  OnboardingStatus _status = OnboardingStatus.ready;
  String? _errorMessage;

  OnboardingViewModel(this._completeOnboardingUseCase);

  OnboardingStatus get status => _status;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _status == OnboardingStatus.loading;
  bool get isCompleted => _status == OnboardingStatus.completed;

  Future<void> completeOnboarding() async {
    if (isLoading) return;

    _setStatus(OnboardingStatus.loading);

    try {
      await _completeOnboardingUseCase();
      _setStatus(OnboardingStatus.completed);
    } catch (error) {
      _errorMessage = error is Failure
          ? error.message
          : 'Something went wrong. Please try again.';
      _setStatus(OnboardingStatus.failure);
    }
  }

  void _setStatus(OnboardingStatus status) {
    _status = status;
    if (status != OnboardingStatus.failure) {
      _errorMessage = null;
    }
    notifyListeners();
  }
}
