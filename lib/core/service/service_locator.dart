import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/datasources/home_local_data_source.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_favorite_plan_ids_usecase.dart';
import '../../features/home/domain/usecases/get_featured_plans_usecase.dart';
import '../../features/home/domain/usecases/toggle_favorite_plan_usecase.dart';
import '../../features/home/presentation/viewmodels/home_view_model.dart';
import '../../features/onboarding/data/datasources/onboarding_local_data_source.dart';
import '../../features/onboarding/data/repositories/onboarding_repository_impl.dart';
import '../../features/onboarding/domain/repositories/onboarding_repository.dart';
import '../../features/onboarding/domain/usecases/check_onboarding_status_usecase.dart';
import '../../features/onboarding/domain/usecases/complete_onboarding_usecase.dart';
import '../../features/onboarding/presentation/viewmodels/onboarding_view_model.dart';
import '../../features/trainers/data/datasources/trainers_local_data_source.dart';
import '../../features/trainers/data/repositories/trainers_repository_impl.dart';
import '../../features/trainers/domain/repositories/trainers_repository.dart';
import '../../features/trainers/domain/usecases/get_trainers_usecase.dart';
import '../../features/trainers/presentation/viewmodels/trainers_view_model.dart';
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

  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(getIt<CacheHelper>()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt<HomeLocalDataSource>()),
  );
  getIt.registerLazySingleton<GetFeaturedPlansUseCase>(
    () => GetFeaturedPlansUseCase(getIt<HomeRepository>()),
  );
  getIt.registerLazySingleton<GetFavoritePlanIdsUseCase>(
    () => GetFavoritePlanIdsUseCase(getIt<HomeRepository>()),
  );
  getIt.registerLazySingleton<ToggleFavoritePlanUseCase>(
    () => ToggleFavoritePlanUseCase(getIt<HomeRepository>()),
  );

  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(
      getIt<GetFeaturedPlansUseCase>(),
      getIt<GetFavoritePlanIdsUseCase>(),
      getIt<ToggleFavoritePlanUseCase>(),
    ),
  );

  getIt.registerLazySingleton<TrainersLocalDataSource>(
    () => const TrainersLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<TrainersRepository>(
    () => TrainersRepositoryImpl(getIt<TrainersLocalDataSource>()),
  );
  getIt.registerLazySingleton<GetTrainersUseCase>(
    () => GetTrainersUseCase(getIt<TrainersRepository>()),
  );

  getIt.registerFactory<TrainersViewModel>(
    () => TrainersViewModel(getIt<GetTrainersUseCase>()),
  );
}
