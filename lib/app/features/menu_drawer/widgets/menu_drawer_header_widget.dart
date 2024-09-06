import 'package:flutter/material.dart';
import 'package:weather_forecast_app/design_system/assets/app_assets.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';

class MenuDrawerHeaderWidget extends StatelessWidget {
  const MenuDrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.background,
          radius: 48,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Transform.translate(
              offset: const Offset(2, -4),
              child: Image.asset(
                AppAssets.appLogo,
                semanticLabel: 'Logo app Clima Atual',
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Clima Atual',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
