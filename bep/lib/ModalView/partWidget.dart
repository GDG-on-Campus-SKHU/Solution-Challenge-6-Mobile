import 'package:flutter/material.dart';

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