import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_forecast_app/app/features/weather/domain/models/weather_model.dart';
import 'package:weather_forecast_app/core/extensions/string_extension.dart';
import 'package:weather_forecast_app/core/models/address_model.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';
import 'package:weather_forecast_app/app/features/weather/ui/components/weather_data_scroll_component.dart';
import 'package:weather_forecast_app/app/features/weather/ui/widgets/extra_data_widget.dart';
import 'package:weather_forecast_app/app/features/weather/ui/widgets/temperature_row_widget.dart';

class WeatherComponent extends StatelessWidget {
  final WeatherModel weather;
  final AddressModel address;
  final double screenHeight;

  const WeatherComponent({
    super.key,
    required this.weather,
    required this.address,
    required this.screenHeight,
  });

  double get mainComponentHeight {
    const cardSize = 130;
    const cardPadding = 48;
    return screenHeight - cardSize - cardPadding;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight + 1),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(40),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(3, 3),
                            blurRadius: 4,
                            spreadRadius: -4,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            weather.location.dateFormatted,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TemperatureRowWidget(weatherDetail: weather.detail),
                          Text(
                            weather.condition.description.capitalize(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SvgPicture.asset(
                            weather.condition.asset,
                            semanticsLabel: 'Condição do clima',
                            fit: BoxFit.fitHeight,
                            height: mainComponentHeight *
                                (mainComponentHeight <= 450 ? 0.2 : 0.35),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ExtraDataWidget(
                                icon: const Icon(
                                  Icons.water_drop_outlined,
                                  color: AppColors.blue,
                                  size: 26,
                                ),
                                data: '${weather.detail.humidity.toInt()}%',
                                description: 'Humidade',
                              ),
                              ExtraDataWidget(
                                icon: const Icon(
                                  Icons.cloud_queue_rounded,
                                  color: AppColors.blue,
                                  size: 26,
                                ),
                                data: '${weather.cloudiness.percent}%',
                                description: 'Nebulosidade',
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  WeatherDataScrollComponent(weather: weather),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
