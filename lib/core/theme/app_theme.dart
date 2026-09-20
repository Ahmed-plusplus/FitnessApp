import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppUi {
  AppUi._();

  static const double cardRadius = 10;
  static const double cardPadding = 12;
  static const double trainerCardRadius = 16;
  static const double trainerCardHorizontalPadding = 8;
  static const double trainerCardVerticalPadding = 16;
  static const double trainerCardImageSize = 96;
  static const double trainerCardHeight =
      trainerCardImageSize + (trainerCardVerticalPadding * 2);
  static const double cardGap = 12;
  static const double contentGap = 8;
  static const double screenTopPadding = 8;
  static const double screenBottomPadding = 24;
  static const double sectionGap = 12;
  static const double cardImageWidth = 86;
  // Home thumbnails fill the card's inner height while respecting its padding.
  static const double cardImageHeight = 110;
  static const double cardHeight = 134;
  static const double cardTextGap = 12;

  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return (width * 0.055).clamp(16.0, 24.0).toDouble();
  }
}

class AppTheme {
  AppTheme._();

  /// Full-width primary call-to-action (e.g. Start Workout).
  static final ButtonStyle primaryCtaButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    elevation: 0,
    minimumSize: const Size(double.infinity, 52),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    textStyle: const TextStyle(
      fontWeight: FontWeight.w700,
      letterSpacing: 1,
    ),
  );

  static const List<BoxShadow> primaryCtaGlow = [
    BoxShadow(
      color: Color(0x590E80F2),
      blurRadius: 16,
      offset: Offset(0, 6),
    ),
  ];

  static const double primaryCtaRadius = 12;

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Lexend',

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.surface,
      error: AppColors.error,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textPrimary,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textSecondary,
      ),
      bodySmall: TextStyle(
        color: AppColors.textMuted,
      ),
      labelLarge: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cardHome,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 13,
      ),

      hintStyle: const TextStyle(
        color: AppColors.textMuted,
        fontSize: 12,
      ),

      labelStyle: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 12,
      ),

      prefixIconColor: AppColors.textMuted,
      suffixIconColor: AppColors.textMuted,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.border,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.border,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 1,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.error,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.error,
        ),
      ),

      errorStyle: const TextStyle(
        color: AppColors.error,
        fontSize: 11,
      ),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        minimumSize: const Size(double.infinity, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        side: const BorderSide(
          color: AppColors.border,
        ),
        minimumSize: const Size(double.infinity, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    ),

    cardTheme: CardThemeData(
      color: AppColors.cardHome,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppUi.cardRadius),
        side: const BorderSide(color: AppColors.border),
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.background,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
  );
}
