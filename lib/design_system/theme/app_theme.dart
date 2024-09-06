import 'package:flutter/material.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';

/*
NAME	            SIZE	  WEIGHT  SPACING	
displayLarge	    96.0	  300	    -1.5	
displayMedium	    60.0	  300	    -0.5	
displaySmall	    48.0	  400	    0.0	
headlineMedium	  34.0	  400	    0.25	
headlineSmall	    24.0	  400	    0.0	
titleLarge	      20.0	  500	    0.15	
titleMedium	      16.0	  400	    0.15	
titleSmall	      14.0	  500	    0.1	
bodyLarge	        16.0	  400	    0.5	
bodyMedium	      14.0	  400	    0.25	
bodySmall	        12.0	  400	    0.4	
labelLarge	      14.0	  500	    1.25	
labelSmall	      10.0	  400	    1.5	
*/

class AppTheme {
  AppTheme._();

  static final data = ThemeData(
    fontFamily: 'Nunito',
    drawerTheme: const DrawerThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.zero,
          right: Radius.circular(16),
        ),
      ),
    ),
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
