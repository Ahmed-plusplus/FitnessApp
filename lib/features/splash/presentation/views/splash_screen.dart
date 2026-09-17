import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/route/app_routes.dart';
import '../../../onboarding/domain/usecases/check_onboarding_status_usecase.dart';

class SplashScreen extends StatefulWidget {
  final CheckOnboardingStatusUseCase checkOnboardingStatusUseCase;

  const SplashScreen({
    required this.checkOnboardingStatusUseCase,
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _redirectUser();
  }

  Future<void> _redirectUser() async {
    try {
      final isOnboardingCompleted =
          await widget.checkOnboardingStatusUseCase();

      if (!mounted) return;

      context.go(
        isOnboardingCompleted ? AppRoutes.login : AppRoutes.onboarding,
      );
    } catch (_) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
