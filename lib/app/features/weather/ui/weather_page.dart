import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/features/ad/banner_ad_widget.dart';
import 'package:weather_forecast_app/app/features/menu_drawer/menu_drawer.dart';
import 'package:weather_forecast_app/app/features/weather/domain/cubits/weather_cubit.dart';
import 'package:weather_forecast_app/app/features/search/domain/models/city_model.dart';
import 'package:weather_forecast_app/app/features/weather/domain/states/weather_state.dart';
import 'package:weather_forecast_app/app/features/weather/ui/widgets/city_name_widget.dart';
import 'package:weather_forecast_app/app_routes.dart';
import 'package:weather_forecast_app/app/features/weather/ui/components/weather_component.dart';
import 'package:weather_forecast_app/core/states/base_state.dart';
import 'package:weather_forecast_app/design_system/loadings/app_loading.dart';
import 'package:weather_forecast_app/design_system/widgets/error_text_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _scaffoldKey.currentState?.dispose();
    super.dispose();
  }

  void onSearchPressed(BuildContext context) async {
    final weatherCubit = context.read<WeatherCubit>();
    final result = await Navigator.pushNamed(context, AppRoutes.searchPage);
    if (result != null && result is CityModel) {
      weatherCubit.getWeather(result.lat, result.lng);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, BaseState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const AppLoading(withScaffold: true);
        }

        if (state is ErrorState) {
          return ErrorTextWidget(text: state.exception.message);
        }

        if (state is WeatherSuccessState) {
          return Scaffold(
            key: _scaffoldKey,
            bottomNavigationBar: const BannerAdWidget(),
            drawer: MenuDrawer(scaffoldKey: _scaffoldKey),
            appBar: AppBar(
              toolbarHeight: 88,
              centerTitle: true,
              title: CityNameWidget(
                weather: state.weather,
                address: state.address,
              ),
              leading: IconButton(
                tooltip: 'Menu',
                icon: const Icon(Icons.menu_rounded),
                onPressed: () => _scaffoldKey.currentState!.openDrawer(),
              ),
              actions: [
                IconButton(
                  tooltip: 'Pesquisar',
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () => onSearchPressed(context),
                )
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                final weatherCubit = context.read<WeatherCubit>();
                await weatherCubit.getWeather();
              },
              child: WeatherComponent(
                weather: state.weather,
                address: state.address,
                screenHeight: MediaQuery.of(context).size.height,
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
