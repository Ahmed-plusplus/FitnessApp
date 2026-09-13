import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../domain/usecases/complete_onboarding_usecase.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final CompleteOnboardingUseCase _completeOnboardingUseCase;

  OnboardingCubit({required CompleteOnboardingUseCase completeOnboardingUseCase})
      : _completeOnboardingUseCase = completeOnboardingUseCase,
        super(const OnboardingInitial());

  Future<void> completeOnboarding() async {
    emit(const OnboardingLoading());
    try {
      await _completeOnboardingUseCase();
      emit(const OnboardingCompletedSuccess());
    } catch (e) {
      final message = e is Failure ? e.message : 'Something went wrong. Please try again.';
      emit(OnboardingCompletedFailure(message));
    }
  }
}
