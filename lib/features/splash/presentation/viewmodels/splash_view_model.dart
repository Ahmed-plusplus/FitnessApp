import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../onboarding/data/repositories/onboarding_repository.dart';
import 'splash_state.dart';

class SplashViewModel extends Cubit<SplashState> {
  final OnboardingRepository _repository;

  SplashViewModel(this._repository) : super(const SplashState());

  Future<void> checkOnboardingStatus() async {
    try {
      final isOnboardingCompleted =
          await _repository.isOnboardingCompleted();

      emit(state.copyWith(
        status: isOnboardingCompleted
            ? SplashStatus.onboardingCompleted
            : SplashStatus.onboardingRequired,
      ));
    } catch (_) {
      emit(state.copyWith(status: SplashStatus.onboardingRequired));
    }
  }
}
