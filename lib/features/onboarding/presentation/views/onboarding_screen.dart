import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/route/app_routes.dart';
import '../../../../core/service/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../cubit/onboarding_cubit.dart';
import '../cubit/onboarding_state.dart';
import '../models/onboarding_content.dart';
import 'widgets/onboarding_app_bar.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OnboardingCubit>(),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatelessWidget {
  const _OnboardingView();

  @override
  Widget build(BuildContext context) {
    final onboarding = OnboardingContent.welcome;
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingCompletedSuccess) {
          context.go(AppRoutes.splash);
        }
        if (state is OnboardingCompletedFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    children: [
                      const OnboardingAppBar(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                        child: Column(
                          children: [
                            Image.asset(
                              onboarding.image,
                              width: double.infinity,
                              height: constraints.maxHeight * 0.48,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              onboarding.title,
                              textAlign: TextAlign.center,
                              style: textTheme.headlineMedium?.copyWith(
                                fontSize: 26,
                                height: 1.15,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              onboarding.description,
                              textAlign: TextAlign.center,
                              style: textTheme.bodyMedium?.copyWith(
                                fontSize: 16,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 26),
                            BlocBuilder<OnboardingCubit, OnboardingState>(
                              builder: (context, state) {
                                final isLoading = state is OnboardingLoading;
                                return SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: isLoading
                                        ? null
                                        : () => context
                                            .read<OnboardingCubit>()
                                            .completeOnboarding(),
                                    child: isLoading
                                        ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: AppColors.white,
                                            ),
                                          )
                                        : Text(onboarding.buttonText),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: 104,
                              height: 3,
                              decoration: BoxDecoration(
                                color: AppColors.border,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
