import 'package:share_plus/share_plus.dart';

Future<void> shareLink(String link) async {
  await SharePlus.instance.share(ShareParams(text: link));
}
