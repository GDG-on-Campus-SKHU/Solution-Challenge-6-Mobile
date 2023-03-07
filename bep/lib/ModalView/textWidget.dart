import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget partWidget() {
  return Container(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
      child: Text(
        'LIFE BELOW WATER',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget quizeWidget() {
  return Container(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: EdgeInsets.fromLTRB(16.0, 36.0, 16.0, 0.0),
      child: Text(
        'Find the countries that plant the most trees',
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget answerWidget() {
  return Column(children: [
    Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 74.0, 16.0, 0.0),
        child: Text(
          'France, in Western Europe, encompasses medieval cities, alpine villages and Mediterranean beaches. Paris, its capital, is famed for its fashion houses, classical art museums including the Louvre and monuments like the Eiffel Tower. The country is also renowned for its wines and sophisticated cuisine. Lascaux’s ancient cave drawings, Lyon’s Roman theater and the vast Palace of Versailles attest to its rich history.',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    ),
    searchLink(),
  ]);
}

Widget searchLink() {
  return Container(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 74.0),
      child: InkWell(
        onTap: () async {
          String query = 'france';
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
