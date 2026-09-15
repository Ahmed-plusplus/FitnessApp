import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/route/app_routes.dart';
import '../models/onboarding_content.dart';
import '../viewmodels/onboarding_view_model.dart';
import 'widgets/onboarding_app_bar.dart';
import 'widgets/onboarding_body.dart';

class OnboardingScreen extends StatefulWidget {
  final OnboardingViewModel viewModel;

  const OnboardingScreen({required this.viewModel, super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  OnboardingViewModel get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    viewModel.addListener(_handleViewModelChange);
  }

  @override
  void dispose() {
    viewModel.removeListener(_handleViewModelChange);
    viewModel.dispose();
    super.dispose();
  }

  void _handleViewModelChange() {
    if (!mounted) return;

    if (viewModel.isCompleted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && viewModel.isCompleted) {
          context.go(AppRoutes.login);
        }
      });
    }

    if (viewModel.status == OnboardingStatus.failure &&
        viewModel.errorMessage != null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(viewModel.errorMessage!)));
    }
  }

  @override
  Widget build(BuildContext context) {
    const content = OnboardingContent.welcome;

    return Scaffold(
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
  }
}
