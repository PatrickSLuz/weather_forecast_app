import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/features/splash/domain/cubits/splash_cubit.dart';
import 'package:weather_forecast_app/core/functions/add_interceptor_function.dart';
import 'package:weather_forecast_app/core/models/geolocation_model.dart';
import 'package:weather_forecast_app/core/states/base_state.dart';
import 'package:weather_forecast_app/design_system/assets/app_assets.dart';
import 'package:weather_forecast_app/app_routes.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';
import 'package:weather_forecast_app/design_system/dialogs/app_information_dialog.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _firstController = AnimationController(
    duration: const Duration(milliseconds: 1200),
    vsync: this,
  );

  late final AnimationController _lastController = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );

  late final Animation<Offset> _firstAnimation = Tween<Offset>(
    begin: const Offset(0, 1),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _firstController,
    curve: Curves.easeInOutBack,
  ));

  late final Animation<Offset> _lastAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 1),
  ).animate(CurvedAnimation(
    parent: _lastController,
    curve: Curves.easeInOutBack,
  ));

  @override
  void initState() {
    super.initState();

    addInterceptors();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final splashCubit = context.read<SplashCubit>();

      await Future.delayed(const Duration(seconds: 1));
      await _firstController.forward();
      splashCubit.getLocation();
    });
  }

  @override
  void dispose() {
    _firstController.dispose();
    _lastController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, BaseState>(
      listener: _listener,
      child: Container(
        color: AppColors.darkBlue,
        child: SlideTransition(
          position: _firstAnimation,
          child: SlideTransition(
            position: _lastAnimation,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Image.asset(
                  AppAssets.appLogo,
                  semanticLabel: 'Logo app Clima Atual',
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, BaseState state) async {
    if (state is LocationServiceDisbaledState) {
      final navigator = Navigator.of(context);
      await showDialog(
        context: context,
        builder: (_) => const AppInformationDialog(
          title: 'Serviço de localização desativada',
          description:
              'Não foi possível usar a localização atual do dispositivo, pois o serviço de localização esta desativado.\nPara ter uma melhor experiência no App, ative a localização e tente novamente!',
        ),
      );
      await _lastController.forward();
      navigator.pushNamedAndRemoveUntil(
        AppRoutes.searchPage,
        (route) => false,
      );
    } else if (state is SuccessState<GeolocationModel>) {
      _lastController.forward().whenCompleteOrCancel(() {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.weatherPage,
          (route) => false,
          arguments: {
            'lat': state.data.latitude,
            'lng': state.data.longitude,
          },
        );
      });
    } else if (state is ErrorState) {
      _lastController.forward().whenCompleteOrCancel(() {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.searchPage,
          (route) => false,
        );
      });
    }
  }
}
