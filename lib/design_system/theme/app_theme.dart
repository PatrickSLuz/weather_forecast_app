import 'package:flutter/material.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final data = ThemeData(
    fontFamily: 'Nunito',
    colorScheme: const ColorScheme.light(
      primary: AppColors.darkBlue,
      secondary: AppColors.lightGrey,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.darkBlue),
      actionsIconTheme: IconThemeData(color: AppColors.darkBlue),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      constraints: BoxConstraints(maxHeight: 50),
      border: OutlineInputBorder(),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all<Color>(AppColors.darkBlue),
      ),
    ),
  );
}
