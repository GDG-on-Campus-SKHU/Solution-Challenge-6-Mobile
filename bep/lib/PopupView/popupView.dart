import 'package:flutter/material.dart';

class popupView extends StatefulWidget {
  @override
  _popupViewState createState() => _popupViewState();
}

class _popupViewState extends State<popupView> {
  int _points = 100;

  void _decrementPoints() {
    setState(() {
      _points -= 10;
    });
  }

  void _incrementPoints() {
    setState(() {
      _points += 10;
    });
  }

  @override
  Widget build(BuildContext context) => Container(
      width: 300,
      height: 240,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 4.0,
        title: Text(
          'How many points would you like to donate?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          TextButton(
            onPressed: _decrementPoints,
            child: const Text(
              '-',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 40),
          Text(
            '$_points',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 40),
          TextButton(
            onPressed: _incrementPoints,
            child: const Text(
              '+',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 125,
                  height: 50,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context, 'NO'),
                    child: const Text(
                      'NO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(54, 123, 183, 1.0),
                          fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(
                        color: Color.fromRGBO(54, 123, 183, 1.0),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 125,
                  height: 50,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context, 'YES'),
                    child: const Text(
                      'YES',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(54, 123, 183, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
}
