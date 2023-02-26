import 'package:bep/Util/quizeType.dart';
import 'package:flutter/material.dart';

class quizeCard extends StatelessWidget {
  final quizeType type;
  final String question;

  quizeCard({required this.type, required this.question});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Container(
        height: 60,
        width: screenSize.width - 32,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 4,
              offset: Offset.zero,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      blurRadius: 4,
                      offset: Offset.zero,
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image(
                    image: AssetImage('assets/tree.png'),
                  ),
                ),
              ),
            ),
            Container(
              width: screenSize.width - 107,
              child: Text(
                question,
                style: TextStyle(fontSize: 14),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
