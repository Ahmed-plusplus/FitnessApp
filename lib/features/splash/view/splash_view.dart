import 'package:fitness_app/core/constants/app_assets.dart';
import 'package:fitness_app/core/constants/app_strings.dart';
import 'package:fitness_app/core/route/app_routes.dart';
import 'package:fitness_app/features/splash/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final SplashViewModel _viewModel;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _viewModel = SplashViewModel();
    _viewModel.addListener(_onSplashFinished);

    _animationController = AnimationController(
      vsync: this,
      duration: SplashViewModel.splashDuration,
    );

    _viewModel.startSplash();
    _animationController.forward();
  }

  void _onSplashFinished() {
    if (_viewModel.isFinished && mounted) {
      context.go(AppRoutes.login);
    }
  }

  @override
  void dispose() {
    _viewModel.removeListener(_onSplashFinished);
    _viewModel.dispose();
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
      backgroundColor: const Color(0xFF101923),
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

          // Bottom background
          Positioned(
            top: imageSectionHeight,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(color: const Color(0xFF101923)),
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
                      style: GoogleFonts.lexend(
                        fontSize: screenWidth * 0.125,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    TextSpan(
                      text: AppStrings.pulse,
                      style: GoogleFonts.lexend(
                        fontSize: screenWidth * 0.125,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF008CFF),
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
                    color: const Color(0xFF008CFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 12),

                // FEEL THE ENERGY
                Text(
                  AppStrings.feelTheEnergy,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: screenWidth * 0.035,
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
                              color: const Color(0xFF008CFF),
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
