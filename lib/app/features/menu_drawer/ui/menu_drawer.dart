import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/features/menu_drawer/ui/widgets/menu_drawer_header_widget.dart';
import 'package:weather_forecast_app/app/features/menu_drawer/ui/widgets/menu_drawer_item_widget.dart';
import 'package:weather_forecast_app/app_routes.dart';
import 'package:weather_forecast_app/core/constants/constants.dart';
import 'package:weather_forecast_app/core/functions/share_function.dart';

class MenuDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MenuDrawer({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
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
                title: 'Home',
                icon: const Icon(Icons.home_outlined),
                onPressed: () {
                  scaffoldKey.currentState!.closeDrawer();
                },
              ),
              MenuDrawerItemWidget(
                title: 'Pesquisar uma cidade',
                icon: const Icon(Icons.search_rounded),
                onPressed: () {
                  scaffoldKey.currentState!.closeDrawer();
                  Navigator.of(context).pushNamed(AppRoutes.searchPage);
                },
              ),
              MenuDrawerItemWidget(
                title: 'Compartilhar App',
                icon: const Icon(Icons.share_outlined),
                onPressed: () {
                  scaffoldKey.currentState!.closeDrawer();
                  shareLink(Constants.androidAppLink);
                },
              ),
              MenuDrawerItemWidget(
                title: 'Sobre',
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
