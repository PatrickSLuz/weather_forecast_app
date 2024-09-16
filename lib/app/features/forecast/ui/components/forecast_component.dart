import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/forecast_model.dart';
import 'package:weather_forecast_app/app/features/forecast/ui/widgets/weather_forecast_card_widget.dart';
import 'package:weather_forecast_app/core/extensions/date_time_extension.dart';
import 'package:weather_forecast_app/core/extensions/string_extension.dart';
import 'package:weather_forecast_app/core/functions/convert_num_to_date_function.dart';
import 'package:weather_forecast_app/core/models/address_model.dart';
import 'package:weather_forecast_app/design_system/divider/app_divider.dart';

class ForecastComponent extends StatelessWidget {
  final ForecastModel forecast;
  final AddressModel address;

  const ForecastComponent({
    super.key,
    required this.forecast,
    required this.address,
  });

  DateTime get dateTimeNowByTimezone {
    return getDateTimeNowByTimezone(forecast.location.timezone);
  }

  double getConditionAssetHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * 0.35;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight + 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '${dateTimeNowByTimezone.dayOfWeek()}\n${dateTimeNowByTimezone.format()}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '${forecast.weathers.first.detail.temperature.toInt()}°',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  forecast.weathers.first.condition.description.capitalize(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SvgPicture.asset(
                  forecast.weathers.first.condition.asset,
                  semanticsLabel: 'Condição do clima',
                  fit: BoxFit.fitHeight,
                  height: getConditionAssetHeight(context),
                ),
                const SizedBox(height: 24),
                const AppDivider(),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Previsão para as próximas horas',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: forecast.weathers.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      return WeatherForecastCardWidget(
                        weather: forecast.weathers[index],
                        location: forecast.location,
                        address: address,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
