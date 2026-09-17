import 'package:fitness_app/features/splash/data/datasources/splash_data_source.dart';
import 'package:fitness_app/features/splash/data/repository/splash_repository.dart';
import 'package:fitness_app/features/splash/presentation/viewmodels/splash_view_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/onboarding/data/datasources/onboarding_local_data_source.dart';
import '../../features/onboarding/data/repositories/onboarding_repository_impl.dart';
import '../../features/onboarding/domain/repositories/onboarding_repository.dart';
import '../../features/onboarding/domain/usecases/complete_onboarding_usecase.dart';
import '../../features/onboarding/presentation/viewmodels/onboarding_view_model.dart';
import '../storage/local/cache/cache_helper.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(getIt<FlutterSecureStorage>()),
  );

  getIt.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(getIt<CacheHelper>()),
  );
  getIt.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(getIt<OnboardingLocalDataSource>()),
  );
  getIt.registerLazySingleton<CompleteOnboardingUseCase>(
    () => CompleteOnboardingUseCase(getIt<OnboardingRepository>()),
  );

  getIt.registerFactory<OnboardingViewModel>(
    () => OnboardingViewModel(getIt<CompleteOnboardingUseCase>()),
  );

  getIt.registerFactory<SplashViewModel>(
        () => SplashViewModel(getIt<SplashRepository>()),
  );
  getIt.registerLazySingleton<SplashRepository>(
        () => SplashRepositoryImpl(getIt<SplashDataSource>()),
  );
  getIt.registerLazySingleton<SplashDataSource>(
        () => SplashDataSourceImpl(getIt<CacheHelper>()),
  );
}
