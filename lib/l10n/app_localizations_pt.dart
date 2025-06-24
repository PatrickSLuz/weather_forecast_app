// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get locale => 'pt_BR';

  @override
  String get appTitle => 'Clima Atual';

  @override
  String get appLogoDescription => 'Logo do app Clima Atual';

  @override
  String get home => 'Home';

  @override
  String get searchCity => 'Pesquisar uma cidade';

  @override
  String get shareApp => 'Compartilhar aplicativo';

  @override
  String get about => 'Sobre';

  @override
  String get search => 'Pesquisar';

  @override
  String get menu => 'Menu';

  @override
  String get weatherCondition => 'Condição do clima';

  @override
  String get useMyLocation => 'Usar minha localização';

  @override
  String get removeCity => 'Remover cidade??';

  @override
  String removeCityDesc(Object cityName) {
    return '$cityName será removida do seu histórico de pesquisa.';
  }

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String version(Object value) {
    return 'Versão: $value';
  }

  @override
  String developedBy(Object name) {
    return 'Desenvolvido por $name';
  }

  @override
  String get forecastNextHours => 'Previsão para as próximas horas';

  @override
  String temperatureFeelsLike(Object value) {
    return 'Sensação térmica de $value';
  }

  @override
  String get humidity => 'Umidade';

  @override
  String get rain => 'Chuva';

  @override
  String rainVolumeHours(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count horas',
      one: 'uma hora',
    );
    return 'Volume de chuva em $_temp0';
  }

  @override
  String get snow => 'Snow';

  @override
  String snowVolumeHours(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count horas',
      one: 'uma hora',
    );
    return 'Volume de neve em $_temp0';
  }

  @override
  String get cloudiness => 'Nebulosidade';

  @override
  String get rainData => 'Dados sobre a chuva';

  @override
  String get snowData => 'Dados sobre a neve';

  @override
  String get windData => 'Dados sobre o vento';

  @override
  String get wind => 'Vento';

  @override
  String get windSpeed => 'Velocidade do vento';

  @override
  String get windGust => 'Rajada de vento';

  @override
  String get windDirection => 'Direção do vento';

  @override
  String get moreInformation => 'Mais informações';

  @override
  String get pressure => 'Pressão atmosférica';

  @override
  String get visibility => 'Visibilidade';

  @override
  String get sunrise => 'Nascer do sol';

  @override
  String get sunset => 'Pôr do sol';

  @override
  String get newVersion => 'Nova versão';

  @override
  String get newVersionDesc => 'Atualize o app para uma melhor experiência!';

  @override
  String get notNow => 'Agora não';

  @override
  String get update => 'Atualizar';

  @override
  String get remove => 'Remover';

  @override
  String get cancel => 'Cancelar';

  @override
  String get back => 'Voltar';

  @override
  String get ok => 'Ok';

  @override
  String get errorPageMessage => 'Dados inválidos ao carregar a página.';

  @override
  String get unknownPageMessage => 'Página desconhecida.';

  @override
  String get defaultErrorTitle => 'Opss!';

  @override
  String get getLocationErrorMessage =>
      'Não foi possível buscar sua localização. Por favor, tente novamente!';

  @override
  String get locationServiceDisbaledTitle =>
      'Serviço de localização desativada';

  @override
  String get locationServiceDisbaledDescription =>
      'Não foi possível usar a localização atual do dispositivo, pois o serviço de localização esta desativado.\nPara ter uma melhor experiência no App, ative a localização e tente novamente!';

  @override
  String get aboutAppDescription =>
      'Bem-vindo ao App Clima Atual. Este aplicativo é a sua solução para previsões climáticas precisas e em tempo real. Com uma interface intuitiva, você pode facilmente acompanhar as condições meteorológicas atuais e planejar seu dia com confiança.\n\nNossa missão é fornecer informações climáticas precisas e fáceis de entender para facilitar seu dia a dia.\nBuscamos transformar a maneira como você planeja e vive, oferecendo uma ferramenta confiável para todas as suas necessidades meteorológicas.\n\nAgradecemos por usar o App Clima Atual! Seu feedback é importante para nós.';
}
