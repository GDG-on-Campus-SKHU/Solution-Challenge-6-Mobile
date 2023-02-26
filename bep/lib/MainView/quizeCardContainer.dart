import 'package:bep/MainView/quizeCard.dart';
import 'package:bep/Util/quizeType.dart';
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
              quizeCard(
                  type: quizeType.Land,
                  question: "Find the countries that plant the most trees"),
              quizeCard(
                  type: quizeType.Land,
                  question: "Find a country where a variety of grasses grow"),
              quizeCard(
                  type: quizeType.Land,
                  question: "Find the countries that plant the most trees"),
            ],
          ),
        ),
      ),
    );
  }
}
