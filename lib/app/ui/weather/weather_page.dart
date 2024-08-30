import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/domain/cubits/weather_cubit.dart';
import 'package:weather_forecast_app/app/domain/models/city_model.dart';
import 'package:weather_forecast_app/app/shared/routes/app_routes.dart';
import 'package:weather_forecast_app/app/ui/weather/components/weather_component.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  void onSearchPressed(BuildContext context) async {
    final weatherCubit = context.read<WeatherCubit>();
    final result = await Navigator.pushNamed(context, AppRoutes.searchPage);
    if (result != null && result is CityModel) {
      weatherCubit.getWeather(result.lat, result.lng);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: 'Pesquisar',
            icon: const Icon(Icons.search_rounded),
            onPressed: () => onSearchPressed(context),
          )
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ErrorState) {
            return const Center(
              child: Text('Error'),
            );
          }

          if (state is SuccessState) {
            return RefreshIndicator(
              onRefresh: () async {
                final weatherCubit = context.read<WeatherCubit>();
                await weatherCubit.refresh();
              },
              child: WeatherComponent(
                weather: state.weather,
                screenHeight: MediaQuery.of(context).size.height,
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
