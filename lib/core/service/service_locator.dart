import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/onboarding/data/datasources/onboarding_local_data_source.dart';
import '../../features/onboarding/data/repositories/onboarding_repository_impl.dart';
import '../../features/onboarding/domain/repositories/onboarding_repository.dart';
import '../../features/onboarding/domain/usecases/check_onboarding_status_usecase.dart';
import '../../features/onboarding/domain/usecases/complete_onboarding_usecase.dart';
import '../../features/onboarding/presentation/viewmodels/onboarding_view_model.dart';
import '../storage/local/cache_helper.dart';

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
  getIt.registerLazySingleton<CheckOnboardingStatusUseCase>(
    () => CheckOnboardingStatusUseCase(getIt<OnboardingRepository>()),
  );
  getIt.registerLazySingleton<CompleteOnboardingUseCase>(
    () => CompleteOnboardingUseCase(getIt<OnboardingRepository>()),
  );

  getIt.registerFactory<OnboardingViewModel>(
    () => OnboardingViewModel(getIt<CompleteOnboardingUseCase>()),
  );
}
