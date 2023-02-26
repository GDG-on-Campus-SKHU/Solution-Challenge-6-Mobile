import 'package:bep/MainView/quizeCard.dart';
import 'package:flutter/material.dart';

class quizeCardContainer extends StatelessWidget {
  quizeCardContainer({required this.isQuizeOpen});
  final bool isQuizeOpen;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isQuizeOpen,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 76),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              quizeCard(),
              quizeCard(),
              quizeCard(),
            ],
          ),
        ),
      ),
    );
  }
}
