import 'package:fitness_app/core/storage/local/cache/cache_helper.dart';
import 'package:fitness_app/core/storage/local/cache/cache_keys.dart';

abstract class SplashDataSource {
  Future<bool> isOnboardingCompleted();
}

class SplashDataSourceImpl implements SplashDataSource {

  final CacheHelper _cacheHelper;

  const SplashDataSourceImpl(this._cacheHelper);

  @override
  Future<bool> isOnboardingCompleted() async {
    return await _cacheHelper.read<bool>(CacheKeys.onboardingCompleted) ?? false;
  }
}