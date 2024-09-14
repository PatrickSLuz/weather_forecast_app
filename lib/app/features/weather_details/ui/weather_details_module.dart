import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/weather_details_page.dart';
import 'package:weather_forecast_app/design_system/pages/error_page.dart';

class WeatherDetailsModule extends StatelessWidget {
  const WeatherDetailsModule({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final data = arguments is Map<String, dynamic> ? arguments : null;

    if (data == null) return const ErrorPage();

    return WeatherDetailsPage(
      weather: data['weather'],
      location: data['location'],
      address: data['address'],
    );
  }
}
