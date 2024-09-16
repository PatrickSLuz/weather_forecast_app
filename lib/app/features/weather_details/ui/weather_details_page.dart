import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_forecast_app/app/features/ad/banner_ad_widget.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/location_model.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/weather_model.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/components/weather_more_information_component.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/components/weather_rain_component.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/components/weather_snow_component.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/components/weather_wind_component.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/widgets/extra_data_widget.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/widgets/temperature_row_widget.dart';
import 'package:weather_forecast_app/app/shared/widgets/city_name_widget.dart';
import 'package:weather_forecast_app/core/extensions/date_time_extension.dart';
import 'package:weather_forecast_app/core/extensions/string_extension.dart';
import 'package:weather_forecast_app/core/models/address_model.dart';
import 'package:weather_forecast_app/design_system/buttons/app_back_button.dart';
import 'package:weather_forecast_app/design_system/divider/app_divider.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                '${weather.dateTime.dayOfWeek()} ${weather.dateTime.format()}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 8),
            TemperatureRowWidget(weatherDetail: weather.detail),
            Text(
              'Sensação térmica de ${weather.detail.feelsLike.toInt()}°',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Text(
              weather.condition.description.capitalize(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.black87,
                  ),
            ),
            SvgPicture.asset(
              weather.condition.asset,
              semanticsLabel: 'Condição do clima',
              fit: BoxFit.fitHeight,
              height: getConditionAssetHeight(context),
            ),
            const SizedBox(height: 16),
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
                    data: '${(weather.pop! * 100).toInt()}%',
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
            ),
            const SizedBox(height: 24),
            if (weather.rain != null) ...[
              const AppDivider(),
              WeatherRainComponent(rain: weather.rain!),
            ],
            if (weather.snow != null) ...[
              const AppDivider(),
              WeatherSnowComponent(snow: weather.snow!),
            ],
            const AppDivider(),
            WeatherWindComponent(wind: weather.wind),
            const AppDivider(),
            WeatherMoreInformationComponent(
              location: location,
              weather: weather,
            ),
          ],
        ),
      ),
    );
  }
}
