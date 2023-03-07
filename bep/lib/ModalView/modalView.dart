import 'package:flutter/material.dart';
import 'package:bep/ModalView/imageWidget.dart';
import 'package:bep/ModalView/textWidget.dart';
import 'package:bep/ModalView/buttonWidget.dart';

Widget modalView(_width, context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    child: Column(
      children: [
        imageWidget(),
        Stack(children: [
          partWidget(),
          quizeWidget(),
          answerWidget(),
          donateBtn(context),
        ]),
      ],
    ),
  );
}
