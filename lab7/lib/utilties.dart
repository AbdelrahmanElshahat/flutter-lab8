import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: non_constant_identifier_names
void LaunchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}

pushPage(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

popPage(BuildContext context) {
  Navigator.pop(context);
}
