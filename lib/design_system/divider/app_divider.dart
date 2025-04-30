import 'package:flutter/material.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';

class AppDivider extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;

  const AppDivider({super.key, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 16,
      width: width ?? double.maxFinite,
      decoration: BoxDecoration(
        color: color ?? AppColors.background.withAlpha((255 / 2).toInt()),
      ),
    );
  }
}
