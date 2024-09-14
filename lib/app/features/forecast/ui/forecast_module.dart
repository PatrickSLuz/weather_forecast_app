import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/cubits/forecast_cubit.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/repositories/i_forecast_repository.dart';
import 'package:weather_forecast_app/design_system/pages/error_page.dart';
import 'package:weather_forecast_app/injector.dart';
import 'package:weather_forecast_app/app/features/forecast/ui/forecast_page.dart';

class ForecastModule extends StatelessWidget {
  const ForecastModule({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final coord = arguments is Map<String, num> ? arguments : null;

    if (coord == null) return const ErrorPage();

    return BlocProvider(
      create: (_) => ForecastCubit(
        getIt.get<IForecastRepository>(),
        coord['lat'],
        coord['lng'],
      ),
      child: const ForecastPage(),
    );
  }
}
