import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/shared/assets/assets.dart';
import 'package:weather_forecast_app/app/shared/routes/app_routes.dart';
import 'package:weather_forecast_app/app/shared/theme/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.searchPage,
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBlue,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Image.asset(
            Assets.appLogo,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ),
      ),
    );
  }
}
