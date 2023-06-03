import 'package:bep/Api/answer.dart';
import 'package:bep/ModalView/ui/buttonWidget.dart';
import 'package:bep/ModalView/ui/imageWidget.dart';
import 'package:bep/ModalView/ui/partWidget.dart';
import 'package:bep/ModalView/ui/quizWidget.dart';
import 'package:bep/ModalView/ui/answerWidget.dart';
import 'package:bep/ModalView/ui/searchLinkWidget.dart';

import 'package:flutter/material.dart';

Widget modalView(_width, context, Answer quizAnswer, Future<void> Function() getPoint) {
  return Container(
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(44)),
    height: MediaQuery.of(context).size.height,
    child: Column(
      children: [
        imageWidget(context, quizAnswer.imgUrl),
        partWidget(quizAnswer.category),
        quizWidget(quizAnswer.question),
        answerWidget(quizAnswer.content),
        searchLinkWidget(quizAnswer.question),
        donateBtn(context, quizAnswer.donationId, quizAnswer.category, getPoint),
      ],
    ),
  );
}
