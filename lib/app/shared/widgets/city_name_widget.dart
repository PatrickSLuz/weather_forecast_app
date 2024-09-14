import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/location_model.dart';
import 'package:weather_forecast_app/core/models/address_model.dart';

class CityNameWidget extends StatelessWidget {
  final LocationModel location;
  final AddressModel address;

  const CityNameWidget({
    super.key,
    required this.location,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          address.city ?? location.city,
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
