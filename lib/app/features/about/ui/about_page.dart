import 'package:flutter/material.dart';
import 'package:weather_forecast_app/core/application_info/i_application_info.dart';
import 'package:weather_forecast_app/core/constants/constants.dart';
import 'package:weather_forecast_app/core/functions/url_launcher_function.dart';
import 'package:weather_forecast_app/design_system/buttons/app_back_button.dart';
import 'package:weather_forecast_app/injector.dart';
import 'package:weather_forecast_app/l10n/internationalization.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final appInfo = getIt<IApplicationInfo>();

  final padding = const EdgeInsets.all(24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        leading: const AppBackButton(),
        title: Text(
          AppIntl.of(context).about,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: padding,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - padding.vertical,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppIntl.of(context).aboutAppDescription,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black87,
                          ),
                    ),
                    const SizedBox(height: 24),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.laptop_mac_rounded),
                            const SizedBox(width: 12),
                            Text(
                              AppIntl.of(context).developedBy('Patrick S. Luz'),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.black87,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.layers_outlined),
                            const SizedBox(width: 12),
                            Text(
                              AppIntl.of(context).version(appInfo.version),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.black87,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      onPressed: () => openLink(Constants.privacyPolicyLink),
                      label: Text(AppIntl.of(context).privacyPolicy),
                      icon: const Icon(
                        Icons.privacy_tip_outlined,
                        color: Colors.white,
                      ),
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
