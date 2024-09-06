import 'package:share_plus/share_plus.dart';

Future<void> shareLink(String link) async {
  // AppOverlayLoading
  await Share.share(link);
}
