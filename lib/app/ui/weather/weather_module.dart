import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/domain/cubits/weather_cubit.dart';
import 'package:weather_forecast_app/app/domain/models/city_model.dart';
import 'package:weather_forecast_app/app/domain/repositories/weather_repository.dart';
import 'package:weather_forecast_app/app/shared/dependency_injection/dependency_injection.dart';
import 'package:weather_forecast_app/app/ui/weather/weather_page.dart';

class WeatherModule extends StatelessWidget {
  const WeatherModule({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final city = arguments is CityModel ? arguments : null;

    return BlocProvider(
      create: (_) => WeatherCubit(getIt.get<WeatherRepository>(), city),
      child: const WeatherPage(),
    );
  }
}
