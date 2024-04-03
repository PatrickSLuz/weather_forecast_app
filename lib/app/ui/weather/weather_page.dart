import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/domain/cubits/weather_cubit.dart';
import 'package:weather_forecast_app/app/shared/routes/app_routes.dart';
import 'package:weather_forecast_app/app/ui/weather/components/weather_component.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.searchPage);
            },
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
            return WeatherComponent(
              weather: state.weather,
              screenHeight: MediaQuery.of(context).size.height,
            );
          }

          return Container();
        },
      ),
    );
  }
}
