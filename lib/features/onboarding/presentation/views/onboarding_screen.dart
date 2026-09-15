import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/route/app_routes.dart';
import '../models/onboarding_content.dart';
import '../viewmodels/onboarding_state.dart';
import '../viewmodels/onboarding_view_model.dart';
import 'widgets/onboarding_app_bar.dart';
import 'widgets/onboarding_body.dart';

class OnboardingScreen extends StatefulWidget {
  final OnboardingViewModel viewModel;

  const OnboardingScreen({
    required this.viewModel,
    super.key,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  OnboardingViewModel get viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    const content = OnboardingContent.welcome;

    return BlocProvider<OnboardingViewModel>(
      create: (_) => viewModel,
      child: BlocConsumer<OnboardingViewModel, OnboardingState>(
        listener: (context, state) {
          if (state.isCompleted) {
            context.go(AppRoutes.login);
          } else if (state.status == OnboardingStatus.failure &&
              state.errorMessage != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                ),
              );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Column(
                        children: [
                          OnboardingAppBar(
                            onPressed: () {
                              viewModel.completeOnboarding();
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              20,
                              8,
                              20,
                              20,
                            ),
                            child: OnboardingBody(
                              content: content,
                              viewModel: viewModel,
                              imageHeight: constraints.maxHeight * 0.48,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
