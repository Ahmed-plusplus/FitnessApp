import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/route/app_routes.dart';
import '../viewmodels/splash_state.dart';
import '../viewmodels/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  final SplashViewModel viewModel;

  const SplashScreen({
    required this.viewModel,
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashViewModel get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    viewModel.checkOnboardingStatus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashViewModel>(
      create: (_) => viewModel,
      child: BlocListener<SplashViewModel, SplashState>(
        listenWhen: (previous, current) =>
            previous.status != current.status &&
            current.status != SplashStatus.loading,
        listener: (context, state) {
          context.go(
            state.status == SplashStatus.onboardingCompleted
                ? AppRoutes.login
                : AppRoutes.onboarding,
          );
        },
        child: const Scaffold(
          body: Center(
            child: Text('Splash'),
          ),
        ),
      ),
    );
  }
}
