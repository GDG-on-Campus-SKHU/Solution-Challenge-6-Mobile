import 'package:bep/ModalView/controller.dart';
import 'package:flutter/material.dart';

Widget imageWidget(context) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(44.0),
      topRight: Radius.circular(44.0),
    ),
    child: Stack(
      children: [
        Image.asset('assets/images/LIFEBELOWWATER.png'),
        Row(
          children: [
            Spacer(),
            controller(),
            Spacer(),
          ],
        ),
      ],
    ),
  );
}
