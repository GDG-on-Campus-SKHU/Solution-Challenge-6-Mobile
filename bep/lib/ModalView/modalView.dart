import 'package:flutter/material.dart';

Widget modalView(_width, context) {
  return Container(
    height: 600,
    child: Column(
      children: [
        Image.asset('assets/images/LIFEBELOWWATER.png'),
        Stack(children: [
          Container(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 325,
              height: 242,
              child: Transform.translate(
                offset: Offset(16, 16),
                child: Text(
                  'LIFE BELOW WATER',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 325,
              height: 242,
              child: Transform.translate(
                offset: Offset(16, 36),
                child: Text(
                  'Find the countries that plant the most trees',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 325,
              height: 300,
              child: Transform.translate(
                offset: Offset(16, 80),
                child: Text(
                  'France, in Western Europe, encompasses medieval cities, alpine villages and Mediterranean beaches. Paris, its capital, is famed for its fashion houses, classical art museums including the Louvre and monuments like the Eiffel Tower. The country is also renowned for its wines and sophisticated cuisine. Lascaux’s ancient cave drawings, Lyon’s Roman theater and the vast Palace of Versailles attest to its rich history.',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 325,
              height: 300,
              child: Transform.translate(
                offset: Offset(16, 380),
                child: Text(
                  '― Google',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 328.0,
            height: 60.0,
            alignment: Alignment.topLeft,
            child: Transform.translate(
              offset: Offset(16, MediaQuery.of(context).size.height - 300),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Donate', style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(328.0, 60.0)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(54, 123, 183, 1.0)),
                ),
              ),
            ),
          ),
        ]),
      ],
    ),
  );
}
