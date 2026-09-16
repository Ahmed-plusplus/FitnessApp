import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/home/presentation/viewmodels/home_view_model.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/onboarding/presentation/viewmodels/onboarding_view_model.dart';
import '../../features/onboarding/presentation/views/onboarding_screen.dart';
import '../../features/splash/presentation/views/splash_screen.dart';
import '../../features/trainers/presentation/viewmodels/trainers_view_model.dart';
import '../../features/trainers/presentation/views/trainers_screen.dart';
import '../service/service_locator.dart';
import 'app_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) {
        return SplashScreen(
          checkOnboardingStatusUseCase: getIt(),
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
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) {
        return HomeScreen(
          viewModel: getIt<HomeViewModel>(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.trainers,
      builder: (context, state) {
        return TrainersScreen(
          viewModel: getIt<TrainersViewModel>(),
        );
      },
    ),
  ],
);
