import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/features/ad/banner_ad_widget.dart';
import 'package:weather_forecast_app/app/features/menu_drawer/ui/menu_drawer.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/cubits/forecast_cubit.dart';
import 'package:weather_forecast_app/app/features/search/domain/models/city_model.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/states/forecast_state.dart';
import 'package:weather_forecast_app/app/shared/widgets/city_name_widget.dart';
import 'package:weather_forecast_app/app_routes.dart';
import 'package:weather_forecast_app/app/features/forecast/ui/components/forecast_component.dart';
import 'package:weather_forecast_app/core/states/base_state.dart';
import 'package:weather_forecast_app/design_system/loadings/app_loading.dart';
import 'package:weather_forecast_app/design_system/widgets/error_text_widget.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _scaffoldKey.currentState?.dispose();
    super.dispose();
  }

  void onSearchPressed(BuildContext context) async {
    final forecastCubit = context.read<ForecastCubit>();
    final result = await Navigator.pushNamed(context, AppRoutes.searchPage);
    if (result != null && result is CityModel) {
      forecastCubit.getForecast(result.lat, result.lng);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastCubit, BaseState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const AppLoading(withScaffold: true);
        }

        if (state is ErrorState) {
          return ErrorTextWidget(
            text: state.exception.message,
            withScaffold: true,
          );
        }

        if (state is ForecastSuccessState) {
          return Scaffold(
            key: _scaffoldKey,
            bottomNavigationBar: const BannerAdWidget(),
            drawer: MenuDrawer(scaffoldKey: _scaffoldKey),
            appBar: AppBar(
              toolbarHeight: 88,
              centerTitle: true,
              title: CityNameWidget(
                location: state.forecast.location,
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
                final forecastCubit = context.read<ForecastCubit>();
                await forecastCubit.getForecast();
              },
              child: ForecastComponent(
                forecast: state.forecast,
                address: state.address,
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
