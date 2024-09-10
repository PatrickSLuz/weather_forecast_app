import 'package:url_launcher/url_launcher.dart';
import 'package:weather_forecast_app/design_system/loadings/app_overlay_loading.dart';

Future<void> openLink(String link) async {
  try {
    AppOverlayLoading.show();
    final opened = await launchUrl(Uri.parse(link));
    if (!opened) {
      await launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
    }
    AppOverlayLoading.hide();
  } catch (e) {
    await launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
  }
}
