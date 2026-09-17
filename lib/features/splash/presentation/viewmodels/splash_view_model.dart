import 'package:fitness_app/core/error/failure.dart';
import 'package:fitness_app/features/splash/data/repository/splash_repository.dart';

class SplashViewModel  {
  static const Duration splashDuration = Duration(seconds: 2);

  final SplashRepository _repository;

  const SplashViewModel(this._repository);

  Future<bool> isOnboardingCompleted() async{
    try {
      return await _repository.isOnboardingCompleted();
    } on CacheFailure catch(e) {
      print(e.message);
      return false;
    }
  }
}