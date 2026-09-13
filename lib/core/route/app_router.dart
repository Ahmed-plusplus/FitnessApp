import 'package:go_router/go_router.dart';

import '../../features/onboarding/presentation/views/onboarding_screen.dart';
import 'app_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.onboarding,
  routes: [
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
  ],
);
