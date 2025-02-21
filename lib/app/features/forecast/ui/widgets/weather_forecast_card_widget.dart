import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/location_model.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/weather_model.dart';
import 'package:weather_forecast_app/app_routes.dart';
import 'package:weather_forecast_app/core/extensions/string_extension.dart';
import 'package:weather_forecast_app/core/models/address_model.dart';
import 'package:weather_forecast_app/l10n/internationalization.dart';

class WeatherForecastCardWidget extends StatelessWidget {
  final WeatherModel weather;
  final LocationModel location;
  final AddressModel address;

  const WeatherForecastCardWidget({
    super.key,
    required this.weather,
    required this.location,
    required this.address,
  });

  void onPressed(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.weatherDetailsPage,
      arguments: {
        'weather': weather,
        'location': location,
        'address': address,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.EEEE().format(weather.dateTime),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      DateFormat.Md().add_Hm().format(weather.dateTime),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black87,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  weather.condition.description.capitalize(),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
            SvgPicture.asset(
              weather.condition.asset,
              semanticsLabel: AppIntl.of(context).weatherCondition,
              fit: BoxFit.fitHeight,
              height: 40,
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 36,
              child: Text(
                '${weather.detail.temperature.toInt()}°',
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            const SizedBox(width: 20),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black45,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
