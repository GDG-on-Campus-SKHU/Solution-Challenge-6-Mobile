import 'package:bep/ModalView/answerWidget.dart';
import 'package:bep/ModalView/buttonWidget.dart';
import 'package:bep/ModalView/imageWidget.dart';
import 'package:bep/ModalView/partWidget.dart';
import 'package:bep/ModalView/quizeWidget.dart';
import 'package:bep/ModalView/searchLinkWidget.dart';

import 'package:flutter/material.dart';

Widget modalView(_width, context, quizAnswer) {
  return Container(
    height: MediaQuery.of(context).size.height,
    child: Column(
      children: [
        imageWidget(context, quizAnswer.imgUrl),
        partWidget(quizAnswer.category),
        quizeWidget(),
        answerWidget(quizAnswer.content),
        searchLinkWidget(),
        donateBtn(context),
      ],
    ),
  );
}
