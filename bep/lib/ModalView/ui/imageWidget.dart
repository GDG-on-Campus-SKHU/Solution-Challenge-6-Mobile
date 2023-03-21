import 'package:bep/ModalView/ui/controller.dart';
import 'package:flutter/material.dart';

Widget imageWidget(context, imgUrl) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(44.0),
      topRight: Radius.circular(44.0),
    ),
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.network(
          '${imgUrl}',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: 240,
        ),
        controller(),
      ],
    ),
  );
}
