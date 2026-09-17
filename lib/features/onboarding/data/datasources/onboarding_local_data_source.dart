import '../../../../core/storage/local/cache_helper.dart';

abstract class OnboardingLocalDataSource {
  Future<bool> isOnboardingCompleted();
  Future<void> setOnboardingCompleted();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  static const _onboardingCompletedKey = 'onboarding_completed';

  final CacheHelper _cacheHelper;

  const OnboardingLocalDataSourceImpl(this._cacheHelper);

  @override
  Future<bool> isOnboardingCompleted() async {
    return await _cacheHelper.read<bool>(_onboardingCompletedKey) ?? false;
  }

  @override
  Future<void> setOnboardingCompleted() {
    return _cacheHelper.write<bool>(_onboardingCompletedKey, true);
  }
}
