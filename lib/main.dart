import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/route/app_router.dart';
import 'core/service/service_locator.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}