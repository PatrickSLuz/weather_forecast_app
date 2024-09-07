import 'package:flutter/material.dart';
import 'package:weather_forecast_app/core/application_info/i_application_info.dart';
import 'package:weather_forecast_app/core/constants/constants.dart';
import 'package:weather_forecast_app/core/functions/url_launcher_function.dart';
import 'package:weather_forecast_app/design_system/buttons/app_back_button.dart';
import 'package:weather_forecast_app/injector.dart';

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
          'Sobre',
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
                    RichText(
                      text: TextSpan(
                        text: 'Bem-vindo ao App ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black87,
                            ),
                        children: const [
                          TextSpan(
                            text: 'Clima Atual. ',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text:
                                'Este aplicativo é a sua solução para previsões climáticas precisas e em tempo real. Com uma interface intuitiva, você pode facilmente acompanhar as condições meteorológicas atuais e planejar seu dia com confiança.',
                          ),
                          TextSpan(text: '\n\n'),
                          TextSpan(
                            text:
                                'Nossa missão é fornecer informações climáticas precisas e fáceis de entender para facilitar seu dia a dia.',
                          ),
                          TextSpan(text: '\n'),
                          TextSpan(
                            text:
                                'Buscamos transformar a maneira como você planeja e vive, oferecendo uma ferramenta confiável para todas as suas necessidades meteorológicas.',
                          ),
                          TextSpan(text: '\n\n'),
                          TextSpan(
                            text: 'Agradecemos por usar o App ',
                          ),
                          TextSpan(
                            text: 'Clima Atual',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: '! Seu feedback é importante para nós.',
                          ),
                          TextSpan(text: '\n\n'),
                          TextSpan(
                            text: 'Desenvolvido por Patrick S. Luz',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: ElevatedButton.icon(
                        onPressed: () => openLink(Constants.privacyPolicyLink),
                        label: const Text('Política de Privacidade'),
                        icon: const Icon(Icons.privacy_tip_outlined),
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(height: 16),
                    Text(
                      '${appInfo.version} (${appInfo.buildNumber})',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black87,
                          ),
                    )
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
