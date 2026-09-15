import 'package:flutter/material.dart';

import 'app.dart';
import 'core/service/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const FitnessApp());
}
