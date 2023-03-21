import 'package:bep/ModalView/ui/buttonWidget.dart';
import 'package:bep/ModalView/ui/imageWidget.dart';
import 'package:bep/ModalView/ui/partWidget.dart';
import 'package:bep/ModalView/ui/quizeWidget.dart';
import 'package:bep/ModalView/ui/answerWidget.dart';
import 'package:bep/ModalView/ui/searchLinkWidget.dart';

import 'package:flutter/material.dart';

Widget modalView(_width, context, quizAnswer) {
  return Container(
    height: MediaQuery.of(context).size.height,
    child: Column(
      children: [
        imageWidget(context, quizAnswer.imgUrl),
        partWidget(quizAnswer.category),
        quizeWidget(quizAnswer.question),
        answerWidget(quizAnswer.content),
        searchLinkWidget(),
        donateBtn(context),
      ],
    ),
  );
}
