import 'package:flutter/material.dart';

Widget answerWidget(content) {
  return Container(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Text(
        '${content}',
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
    ),
  );
}
