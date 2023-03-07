import 'package:flutter/material.dart';

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
