import 'package:fitness_app/core/constants/app_assets.dart';
import 'package:fitness_app/core/constants/app_strings.dart';
import 'package:fitness_app/core/route/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/features/splash/presentation/viewmodels/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {

  final SplashViewModel viewModel;

  const SplashScreen({
    required this.viewModel,
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late final AnimationController _animationController;

  late Function(AnimationStatus) listener = (status) {
    if (status == AnimationStatus.completed) {
      _redirectUser();
    }
  };

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: SplashViewModel.splashDuration,
    );

    _animationController.addStatusListener(listener);
    _animationController.forward();
  }

  Future<void> _redirectUser() async {
    try {
      final isOnboardingCompleted =
          await widget.viewModel.isOnboardingCompleted();

      if (!mounted) return;

      context.go(
        isOnboardingCompleted ? AppRoutes.login : AppRoutes.onboarding,
      );
    } catch (_) {
    }
  }

  @override
  void dispose() {
    _animationController.removeStatusListener(listener);
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    final imageSectionHeight = screenHeight * 0.625;

    return Scaffold(
      body: Stack(
        children: [
          // Main background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: imageSectionHeight,
            child: Image.asset(
              AppAssets.splashBackground,
              fit: BoxFit.cover,
            ),
          ),

          // Iron icon
          Positioned(
            top: imageSectionHeight - screenHeight * 0.065,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                AppAssets.splashIcon,
                width: screenHeight * 0.16,
                height: screenHeight * 0.16,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // IRONPULSE
          Positioned(
            top: screenHeight * 0.735,
            left: 0,
            right: 0,
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppStrings.iron,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: 48,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    TextSpan(
                      text: AppStrings.pulse,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: 48,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                            height: 1,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Small blue line
          Positioned(
            top: screenHeight * 0.81,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  width: screenWidth * 0.10,
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 12),

                // FEEL THE ENERGY
                Text(
                  AppStrings.feelTheEnergy,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 4,
                  ),
                ),

                const SizedBox(height: 25),

                // Animated progress indicator
                SizedBox(
                  width: screenWidth * 0.28,
                  height: 4,
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: _animationController.value,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
