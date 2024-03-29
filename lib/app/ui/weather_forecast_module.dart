import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/domain/cubits/weather_cubit.dart';
import 'package:weather_forecast_app/app/domain/repositories/weather_forecast_repository.dart';
import 'package:weather_forecast_app/app/shared/dependency_injection/dependency_injection.dart';
import 'package:weather_forecast_app/app/ui/weather_forecast_page.dart';

class WeatherForecastModule extends StatelessWidget {
  const WeatherForecastModule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherCubit(getIt.get<WeatherForecastRepository>()),
      child: const WeatherForecastPage(),
    );
  }
}
