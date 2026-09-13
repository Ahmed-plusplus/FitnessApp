sealed class OnboardingState {
  const OnboardingState();
}

class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();
}

class OnboardingLoading extends OnboardingState {
  const OnboardingLoading();
}

class OnboardingCompletedSuccess extends OnboardingState {
  const OnboardingCompletedSuccess();
}

class OnboardingCompletedFailure extends OnboardingState {
  final String message;

  const OnboardingCompletedFailure(this.message);
}
