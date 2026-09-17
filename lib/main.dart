import 'package:flutter/material.dart';

import 'app.dart';
import 'core/service/service_locator.dart';
import 'core/storage/local/hive_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();
  await getIt<HiveHelper>().init();
  runApp(const FitnessApp());
}
