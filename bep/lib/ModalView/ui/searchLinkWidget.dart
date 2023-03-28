import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget searchLinkWidget(String query) {
  return Container(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: EdgeInsets.fromLTRB(16.0, 1.0, 0, 0),
      child: InkWell(
        onTap: () async {
          Uri uri = Uri.parse('https://www.google.com/search?q=$query');
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            throw 'Could not launch $uri';
          }
        },
        child: Text(
          '― Google',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Color.fromRGBO(73, 124, 255, 1.0),
          ),
        ),
      ),
    ),
  );
}
