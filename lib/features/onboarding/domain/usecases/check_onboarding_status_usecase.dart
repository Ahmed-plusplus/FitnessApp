import '../repositories/onboarding_repository.dart';

class CheckOnboardingStatusUseCase {
  final OnboardingRepository _repository;

  const CheckOnboardingStatusUseCase(this._repository);

  Future<bool> call() => _repository.isOnboardingCompleted();
}
