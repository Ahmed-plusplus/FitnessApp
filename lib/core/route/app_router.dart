import 'package:fitness_app/core/route/app_routes.dart';
import 'package:fitness_app/features/splash/presentation/viewmodels/splash_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/onboarding/presentation/viewmodels/onboarding_view_model.dart';
import '../../features/onboarding/presentation/views/onboarding_screen.dart';
import '../../features/splash/presentation/views/splash_screen.dart';
import '../service/service_locator.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) {
        return SplashScreen(
          viewModel: getIt<SplashViewModel>(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) {
        return OnboardingScreen(
          viewModel: getIt<OnboardingViewModel>(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);