import 'package:fitness_app/core/route/app_routes.dart';
import 'package:fitness_app/features/login/view/login_view.dart';
import 'package:fitness_app/features/splash/view/splash_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginView(),
    ),
  ],
);
