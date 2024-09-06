import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/features/weather/domain/models/weather_model.dart';
import 'package:weather_forecast_app/core/models/address_model.dart';

class CityNameWidget extends StatelessWidget {
  final WeatherModel weather;
  final AddressModel address;

  const CityNameWidget({
    super.key,
    required this.weather,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          address.city ?? weather.location.city,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          address.stateWithIsoCountryCode,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
