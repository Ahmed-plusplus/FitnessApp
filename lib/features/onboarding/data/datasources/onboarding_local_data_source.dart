import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class OnboardingLocalDataSource {
  Future<bool> isOnboardingCompleted();

  Future<void> setOnboardingCompleted();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  static const _onboardingCompletedKey = 'onboarding_completed';

  final FlutterSecureStorage _secureStorage;

  const OnboardingLocalDataSourceImpl(this._secureStorage);

  @override
  Future<bool> isOnboardingCompleted() async {
    final value = await _secureStorage.read(key: _onboardingCompletedKey);
    return value == 'true';
  }

  @override
  Future<void> setOnboardingCompleted() async {
    await _secureStorage.write(key: _onboardingCompletedKey, value: 'true');
  }
}
