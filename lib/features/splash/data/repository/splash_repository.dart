import 'package:fitness_app/core/error/failure.dart';
import 'package:fitness_app/features/splash/data/datasources/splash_data_source.dart';

abstract class SplashRepository {
  Future<bool> isOnboardingCompleted();
}

class SplashRepositoryImpl implements SplashRepository {
  final SplashDataSource _localDataSource;

  const SplashRepositoryImpl(this._localDataSource);
  @override
  Future<bool> isOnboardingCompleted() async {
    try {
      return await _localDataSource.isOnboardingCompleted();
    } catch (e) {
      throw CacheFailure('Failed to read onboarding status: $e');
    }
  }
}