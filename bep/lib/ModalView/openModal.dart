import 'package:flutter/material.dart';
import 'package:bep/ModalView/modalView.dart';

void openModal(context, quizAnswer) {
  final _width = MediaQuery.of(context).size.width;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(44.0),
        topRight: Radius.circular(44.0),
      ),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: modalView(_width, context, quizAnswer),
          );
        },
      );
    },
  );
}
