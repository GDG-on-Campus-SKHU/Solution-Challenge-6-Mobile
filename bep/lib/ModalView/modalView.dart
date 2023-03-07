import 'package:flutter/material.dart';
import 'package:bep/ModalView/';

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
          searchWidget(),
          donateBtn(context),
        ]),
      ],
    ),
  );
}
