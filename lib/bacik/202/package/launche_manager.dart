import 'package:url_launcher/url_launcher.dart';

mixin LauncheManager {
  Future<void> launchUrlSend(String takeUrl) async {
    final Uri url = Uri.parse(takeUrl);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
