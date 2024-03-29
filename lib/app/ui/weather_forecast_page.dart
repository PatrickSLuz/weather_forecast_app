import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/domain/cubits/weather_cubit.dart';
import 'package:weather_forecast_app/app/ui/components/weather_forecast_component.dart';

class WeatherForecastPage extends StatelessWidget {
  const WeatherForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              return WeatherForecastComponent(
                weather: state.weather,
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
