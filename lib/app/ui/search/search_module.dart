import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/domain/cubits/search_cubit.dart';
import 'package:weather_forecast_app/app/domain/repositories/geo_repository.dart';
import 'package:weather_forecast_app/app/shared/dependency_injection/dependency_injection.dart';
import 'package:weather_forecast_app/app/ui/search/search_page.dart';

class SearchModule extends StatelessWidget {
  const SearchModule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(getIt.get<GeoRepository>()),
      child: const SearchPage(),
    );
  }
}
