import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/shared/services/app_geolocation_service.dart';
import 'package:weather_forecast_app/app/features/search/domain/cubits/geolocation_cubit.dart';
import 'package:weather_forecast_app/injector.dart';
import 'package:weather_forecast_app/app/features/splash/ui/splash_page.dart';

class SplashModule extends StatelessWidget {
  const SplashModule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GeolocationCubit(getIt.get<AppGeolocationService>()),
      child: const SplashPage(),
    );
  }
}