import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/home/presentation/viewmodels/home_view_model.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/onboarding/presentation/viewmodels/onboarding_view_model.dart';
import '../../features/onboarding/presentation/views/onboarding_screen.dart';
import '../../features/plan_details/presentation/viewmodels/plan_details_view_model.dart';
import '../../features/plan_details/presentation/views/plan_details_screen.dart';
import '../../features/plans/presentation/viewmodels/plans_view_model.dart';
import '../../features/plans/presentation/views/plans_screen.dart';
import '../../features/splash/presentation/viewmodels/splash_view_model.dart';
import '../../features/splash/presentation/views/splash_screen.dart';
import '../../features/trainers/presentation/viewmodels/trainers_view_model.dart';
import '../../features/trainers/presentation/views/trainers_screen.dart';
import '../service/service_locator.dart';
import 'app_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.home,
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
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) {
        return HomeScreen(
          viewModel: getIt<HomeViewModel>(),
        );
      },
    ),
    GoRoute(
      path: '${AppRoutes.planDetails}/:planId',
      builder: (context, state) {
        // An invalid id shows the "plan not found" error view.
        final planId = int.tryParse(state.pathParameters['planId'] ?? '') ?? -1;
        return PlanDetailsScreen(
          viewModel: getIt<PlanDetailsViewModel>(),
          planId: planId,
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
    GoRoute(
      path: AppRoutes.plans,
      builder: (context, state) {
        return PlansScreen(
          viewModel: getIt<PlansViewModel>(),
        );
      },
    ),
  ],
);
