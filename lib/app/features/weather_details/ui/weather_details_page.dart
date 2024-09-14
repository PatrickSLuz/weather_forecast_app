import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_forecast_app/app/features/ad/banner_ad_widget.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/location_model.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/weather_model.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/components/weather_data_scroll_component.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/widgets/extra_data_widget.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/widgets/temperature_row_widget.dart';
import 'package:weather_forecast_app/app/shared/widgets/city_name_widget.dart';
import 'package:weather_forecast_app/core/extensions/date_time_extension.dart';
import 'package:weather_forecast_app/core/extensions/string_extension.dart';
import 'package:weather_forecast_app/core/models/address_model.dart';
import 'package:weather_forecast_app/design_system/buttons/app_back_button.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';

class WeatherDetailsPage extends StatelessWidget {
  final WeatherModel weather;
  final LocationModel location;
  final AddressModel address;

  const WeatherDetailsPage({
    super.key,
    required this.location,
    required this.weather,
    required this.address,
  });

  double getConditionAssetHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const cardSize = 130;
    const cardPadding = 48;
    final componentHeight = screenHeight - cardSize - cardPadding;
    return componentHeight * (componentHeight <= 450 ? 0.2 : 0.35);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const BannerAdWidget(),
      appBar: AppBar(
        toolbarHeight: 88,
        centerTitle: true,
        leading: const AppBackButton(),
        title: CityNameWidget(
          location: location,
          address: address,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
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
                              '${weather.dateTime.dayOfWeek()}\n${weather.dateTime.format()}',
                              textAlign: TextAlign.center,
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
                              height: getConditionAssetHeight(context),
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
                                  description: 'Umidade',
                                ),
                                if (weather.pop != null)
                                  ExtraDataWidget(
                                    icon: const Icon(
                                      CupertinoIcons.cloud_rain,
                                      color: AppColors.blue,
                                      size: 24,
                                    ),
                                    data: '${(weather.pop! / 100).toInt()}%',
                                    description: 'Chuva',
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
                    WeatherDataScrollComponent(
                      location: location,
                      weather: weather,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
