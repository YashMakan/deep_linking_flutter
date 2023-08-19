import 'package:deep_linking_flutter/pages/color_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';

class DeepLinkHandler {
  String? initialLink;
  Stream<Uri?>? stream;

  DeepLinkHandler._privateConstructor();

  static final DeepLinkHandler _instance =
      DeepLinkHandler._privateConstructor();

  static DeepLinkHandler get instance => _instance;

  Future<void> initUniLinks() async {
    try {
      initialLink = await getInitialLink();
      stream = uriLinkStream;
    } catch (e) {
      print('Error getting initial link: $e');
    }
  }

  void handleDeepLink(BuildContext context, String link) {
    Color? color;
    if (link.split('/').last == 'red') {
      color = Colors.red;
    } else if (link.split('/').last == 'blue') {
      color = Colors.blue;
    }

    if (color != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ColorDetailPage(color: color!)));
    }
  }
}
