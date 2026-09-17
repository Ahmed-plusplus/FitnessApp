import '../../../../core/storage/local/cache/cache_helper.dart';

abstract class OnboardingLocalDataSource {
  Future<void> setOnboardingCompleted();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  static const _onboardingCompletedKey = 'onboarding_completed';

  final CacheHelper _cacheHelper;

  const OnboardingLocalDataSourceImpl(this._cacheHelper);

  @override
  Future<void> setOnboardingCompleted() {
    return _cacheHelper.write<bool>(_onboardingCompletedKey, true);
  }
}
