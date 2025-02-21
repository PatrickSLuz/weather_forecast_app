import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/features/menu_drawer/ui/widgets/menu_drawer_header_widget.dart';
import 'package:weather_forecast_app/app/features/menu_drawer/ui/widgets/menu_drawer_item_widget.dart';
import 'package:weather_forecast_app/app/features/search/domain/models/city_model.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/cubits/forecast_cubit.dart';
import 'package:weather_forecast_app/app_routes.dart';
import 'package:weather_forecast_app/core/constants/constants.dart';
import 'package:weather_forecast_app/core/functions/share_function.dart';
import 'package:weather_forecast_app/l10n/internationalization.dart';

class MenuDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MenuDrawer({
    super.key,
    required this.scaffoldKey,
  });

  void _onCitySearchPressed(BuildContext context) async {
    final forecastCubit = context.read<ForecastCubit>();
    final result = await Navigator.of(context).pushNamed(AppRoutes.searchPage);
    if (result != null && result is CityModel) {
      forecastCubit.getForecast(result.lat, result.lng);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: MenuDrawerHeaderWidget(),
              ),
              const SizedBox(height: 24),
              MenuDrawerItemWidget(
                title: AppIntl.of(context).home,
                icon: const Icon(Icons.home_outlined),
                onPressed: () {
                  scaffoldKey.currentState!.closeDrawer();
                },
              ),
              MenuDrawerItemWidget(
                title: AppIntl.of(context).searchCity,
                icon: const Icon(Icons.search_rounded),
                onPressed: () async {
                  scaffoldKey.currentState!.closeDrawer();
                  _onCitySearchPressed(context);
                },
              ),
              MenuDrawerItemWidget(
                title: AppIntl.of(context).shareApp,
                icon: const Icon(Icons.share_outlined),
                onPressed: () {
                  scaffoldKey.currentState!.closeDrawer();
                  FirebaseAnalytics.instance.logEvent(name: 'share_app');
                  shareLink(Constants.androidAppLink);
                },
              ),
              MenuDrawerItemWidget(
                title: AppIntl.of(context).about,
                icon: const Icon(Icons.info_outline_rounded),
                onPressed: () {
                  scaffoldKey.currentState!.closeDrawer();
                  Navigator.of(context).pushNamed(AppRoutes.aboutPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
