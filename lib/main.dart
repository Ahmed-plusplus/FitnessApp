import 'package:flutter/material.dart';

import 'core/service/service_locator.dart';
import 'core/storage/local/hive_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();

  await getIt<HiveHelper>().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Fitness App', debugShowCheckedModeBanner: false);
  }
}
