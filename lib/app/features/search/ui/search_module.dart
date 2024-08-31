import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/features/search/domain/cubits/search_cubit.dart';
import 'package:weather_forecast_app/app/features/search/domain/repositories/i_city_repository.dart';
import 'package:weather_forecast_app/app/features/search/domain/repositories/i_geo_repository.dart';
import 'package:weather_forecast_app/core/geolocation/i_geolocation.dart';
import 'package:weather_forecast_app/injector.dart';
import 'package:weather_forecast_app/app/features/search/ui/search_page.dart';

class SearchModule extends StatelessWidget {
  const SearchModule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(
        getIt.get<IGeoRepository>(),
        getIt.get<ICityRepository>(),
        getIt.get<IGeolocation>(),
      ),
      child: const SearchPage(),
    );
  }
}
