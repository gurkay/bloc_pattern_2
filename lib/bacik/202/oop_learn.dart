import 'dart:io';

import 'package:bloc_pattern_2/bacik/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);
  Future<void> launchUrlSend(String takeUrl) async {
    final Uri url = Uri.parse(takeUrl);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

class FileDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    print('loading...');
    return true;
  }

  @override
  Future<void> launchUrlSend(String takeUrl) async {
    final Uri url = Uri.parse(takeUrl);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

abstract class SmsDownload extends IFileDownload {
  @override
  Future<void> launchUrlSend(String smsPath) async {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: smsPath,
      queryParameters: <String, String>{
        'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
      },
    );
    if (!await launchUrl(smsLaunchUri)) {
      throw Exception('$smsLaunchUri');
    }
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

mixin ShareMixin on IFileDownload {
  void toShowFile() {}
}
