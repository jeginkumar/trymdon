import 'dart:io';
// import 'package:flutter_web_browser/flutter_web_browser.dart';
// import 'package:launch_review/launch_review.dart';
import 'package:trymd_partner/config/api_config.dart';
import 'package:trymd_partner/global_widget/global_widgets.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;
import 'package:url_launcher/url_launcher.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AppService {
  Future<bool> checkInternet() async {
    bool internet;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        internet = true;
      }
    } on SocketException catch (_) {
      print('not connected');
      internet = false;
    }
    return internet;
  }

  Future openLink(context, String url) async {
    if (await urlLauncher.canLaunch(url)) {
      urlLauncher.launch(url);
    } else {
      GlobalWidget().toastMessage("Can't launch the url");
    }
  }

  Future openEmailSupport(context) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: AppConfig().supportEmail,
      query:
          'subject=About ${AppConfig().appName}&body=', //add subject and body here
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      GlobalWidget().toastMessage("Can't launch the email");
    }
  }

  static getYoutubeVideoIdFromUrl(String videoUrl) {
    /// Need to include the youtube_player plugin to load youtube videos inside the application
    // return YoutubePlayer.convertUrlToId(videoUrl, trimWhitespaces: true);
  }
}
