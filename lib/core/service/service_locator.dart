import 'package:get_it/get_it.dart';

import '../storage/local/hive_helper.dart';
import '../storage/remote/network/api/api_consumer.dart';
import '../storage/remote/network/api/dio_consumer.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer());

  getIt.registerLazySingleton<HiveHelper>(() => HiveHelper());
}
