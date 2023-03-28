import 'package:flutter/material.dart';
import 'package:bep/ModalView/ui/modalView.dart';

void openModal(context, quizAnswer, Future<void> Function() getPoint) {
  final _width = MediaQuery.of(context).size.width;

  showModalBottomSheet(
    backgroundColor: Color.fromARGB(0, 0, 0, 0),
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0.0),
        topRight: Radius.circular(0.0),
      ),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: modalView(_width, context, quizAnswer, getPoint),
          );
        },
      );
    },
  );
}
