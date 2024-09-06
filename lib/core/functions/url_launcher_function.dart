import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(String link) async {
  try {
    await launchUrl(Uri.parse(link));
  } catch (e) {
    await launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
  }
}
