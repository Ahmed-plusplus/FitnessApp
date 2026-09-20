import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/datasources/home_local_data_source.dart';
import '../../features/home/data/repositories/home_repository.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/presentation/viewmodels/home_view_model.dart';
import '../../features/onboarding/data/datasources/onboarding_local_data_source.dart';
import '../../features/onboarding/data/repositories/onboarding_repository.dart';
import '../../features/onboarding/data/repositories/onboarding_repository_impl.dart';
import '../../features/onboarding/presentation/viewmodels/onboarding_view_model.dart';
import '../../features/plan_details/data/datasources/plan_details_local_data_source.dart';
import '../../features/plan_details/data/repositories/plan_details_repository.dart';
import '../../features/plan_details/data/repositories/plan_details_repository_impl.dart';
import '../../features/plan_details/presentation/viewmodels/plan_details_view_model.dart';
import '../../features/plans/data/datasources/plans_local_data_source.dart';
import '../../features/plans/data/repositories/plans_repository.dart';
import '../../features/plans/data/repositories/plans_repository_impl.dart';
import '../../features/plans/presentation/viewmodels/plans_view_model.dart';
import '../../features/splash/presentation/viewmodels/splash_view_model.dart';
import '../../features/trainers/data/datasources/trainers_local_data_source.dart';
import '../../features/trainers/data/repositories/trainers_repository.dart';
import '../../features/trainers/data/repositories/trainers_repository_impl.dart';
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

  getIt.registerFactory<OnboardingViewModel>(
    () => OnboardingViewModel(getIt<OnboardingRepository>()),
  );

  getIt.registerFactory<SplashViewModel>(
    () => SplashViewModel(getIt<OnboardingRepository>()),
  );

  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(getIt<CacheHelper>()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt<HomeLocalDataSource>()),
  );

  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(getIt<HomeRepository>()),
  );

  getIt.registerLazySingleton<PlanDetailsLocalDataSource>(
    () => PlanDetailsLocalDataSourceImpl(getIt<CacheHelper>()),
  );
  getIt.registerLazySingleton<PlanDetailsRepository>(
    () => PlanDetailsRepositoryImpl(getIt<PlanDetailsLocalDataSource>()),
  );

  getIt.registerFactory<PlanDetailsViewModel>(
    () => PlanDetailsViewModel(getIt<PlanDetailsRepository>()),
  );

  getIt.registerLazySingleton<PlansLocalDataSource>(
    () => const PlansLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<PlansRepository>(
    () => PlansRepositoryImpl(getIt<PlansLocalDataSource>()),
  );

  getIt.registerFactory<PlansViewModel>(
    () => PlansViewModel(getIt<PlansRepository>()),
  );

  getIt.registerLazySingleton<TrainersLocalDataSource>(
    () => const TrainersLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<TrainersRepository>(
    () => TrainersRepositoryImpl(getIt<TrainersLocalDataSource>()),
  );

  getIt.registerFactory<TrainersViewModel>(
    () => TrainersViewModel(getIt<TrainersRepository>()),
  );
}
