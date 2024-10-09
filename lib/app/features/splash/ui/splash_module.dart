import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/features/splash/domain/cubits/splash_cubit.dart';
import 'package:weather_forecast_app/app/shared/services/check_update_app_service.dart';
import 'package:weather_forecast_app/core/geolocation/i_geolocation.dart';
import 'package:weather_forecast_app/injector.dart';
import 'package:weather_forecast_app/app/features/splash/ui/splash_page.dart';

class SplashModule extends StatelessWidget {
  const SplashModule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(
        getIt.get<IGeolocation>(),
        getIt.get<CheckUpdateAppService>(),
      ),
      child: const SplashPage(),
    );
  }
}
