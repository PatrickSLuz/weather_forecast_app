import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/wind_model.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/widgets/data_row_widget.dart';
import 'package:weather_forecast_app/core/extensions/num_extension.dart';
import 'package:weather_forecast_app/design_system/assets/app_assets.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';
import 'package:weather_forecast_app/l10n/internationalization.dart';

class WeatherWindComponent extends StatelessWidget {
  final WindModel wind;

  const WeatherWindComponent({
    super.key,
    required this.wind,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppIntl.of(context).windData,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 24),
          DataRowWidget(
            icon: Image.asset(
              AppAssets.wind,
              semanticLabel: AppIntl.of(context).windSpeed,
              height: 24,
              width: 24,
              color: AppColors.grey,
            ),
            data: '${wind.speed.inKmPerHour()} km/h',
            description: AppIntl.of(context).windSpeed,
          ),
          const SizedBox(height: 16),
          if (wind.gust != null) ...[
            DataRowWidget(
              icon: Image.asset(
                AppAssets.wind,
                semanticLabel: AppIntl.of(context).windGust,
                height: 24,
                width: 24,
                color: AppColors.grey,
              ),
              data: '${wind.gust!.inKmPerHour()} km/h',
              description: AppIntl.of(context).windGust,
            ),
            const SizedBox(height: 16),
          ],
          DataRowWidget(
            icon: Transform.rotate(
              angle: wind.degrees.toRadians(),
              child: const Icon(
                Icons.navigation_rounded,
                color: AppColors.grey,
                size: 24,
              ),
            ),
            data: wind.compassDirection,
            description: AppIntl.of(context).windDirection,
          ),
        ],
      ),
    );
  }
}
