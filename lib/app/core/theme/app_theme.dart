import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/core/theme/app_typography.dart';

class AppTheme {
  static ThemeData get light => FlexThemeData.light(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryButton,
      secondary: AppColors.green,
      tertiary: AppColors.orange,
    ),
    textTheme: TextTheme(
      titleLarge: AppTypography.titleLarge,
      titleMedium: AppTypography.titleMedium,
      labelLarge: AppTypography.labelLarge,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      bodySmall: AppTypography.bodySmall,
    ),
  ).copyWith(scaffoldBackgroundColor: AppColors.background);
}
