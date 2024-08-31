import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/features/weather/domain/cubits/weather_cubit.dart';
import 'package:weather_forecast_app/app/features/weather/domain/repositories/i_weather_repository.dart';
import 'package:weather_forecast_app/injector.dart';
import 'package:weather_forecast_app/app/features/weather/ui/weather_page.dart';

class WeatherModule extends StatelessWidget {
  const WeatherModule({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final coord = arguments is Map<String, num> ? arguments : null;

    return BlocProvider(
      create: (_) => WeatherCubit(
        getIt.get<IWeatherRepository>(),
        coord!['lat'],
        coord['lng'],
      ),
      child: const WeatherPage(),
    );
  }
}
