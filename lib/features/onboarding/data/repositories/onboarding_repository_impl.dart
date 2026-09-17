import '../../../../core/error/failure.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_local_data_source.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource _localDataSource;

  const OnboardingRepositoryImpl(this._localDataSource);

  @override
  Future<void> completeOnboarding() async {
    try {
      await _localDataSource.setOnboardingCompleted();
    } catch (e) {
      throw CacheFailure('Failed to save onboarding status: $e');
    }
  }
}
