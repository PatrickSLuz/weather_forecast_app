import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/rain_snow_model.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/widgets/data_row_widget.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';

class WeatherSnowComponent extends StatelessWidget {
  final RainSnowModel snow;

  const WeatherSnowComponent({
    super.key,
    required this.snow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Dados sobre a neve',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 24),
          if (snow.last1Hour != null) ...[
            DataRowWidget(
              icon: const Icon(
                CupertinoIcons.cloud_snow,
                color: AppColors.blue,
                size: 24,
              ),
              data: '${snow.last1Hour} mm',
              description: 'Volume de neve em uma hora',
            ),
            const SizedBox(height: 16),
          ],
          if (snow.last3Hour != null)
            DataRowWidget(
              icon: const Icon(
                CupertinoIcons.cloud_snow,
                color: AppColors.blue,
                size: 24,
              ),
              data: '${snow.last3Hour} mm',
              description: 'Volume de neve em 3 horas',
            ),
        ],
      ),
    );
  }
}
