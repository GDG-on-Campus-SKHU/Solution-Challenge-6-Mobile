import 'package:flutter/material.dart';

Widget quizeWidget(question) {
  return Container(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
      child: Text(
        '${question}',
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
