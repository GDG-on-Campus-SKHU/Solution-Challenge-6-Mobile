import 'package:bep/Api/donationController.dart';
import 'package:bep/PopupView/titlePopup.dart';
import 'package:flutter/material.dart';

class popupView extends StatefulWidget {
  final int id;
  final String category;
  final Future<void> Function() getPoint;

  popupView({required this.id, required this.category, required this.getPoint});

  @override
  _popupViewState createState() => _popupViewState();
}

class _popupViewState extends State<popupView> {
  int _points = 100;
  DonationController donationController = DonationController();

  Future<int> donateToCategory() async {
    return await donationController.donateToCategory(
        widget.id, widget.category, _points, widget.getPoint);
  }

  void _decrementPoints() {
    setState(() {
      if (_points > 10) {
        _points -= 10;
      }
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
          title: titlePopup(),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextButton(
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
              ),
              Text(
                '$_points',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextButton(
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
              ),
            ],
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      onPressed: () => {
                        donateToCategory(),
                        Navigator.pop(context, 'YES'),
                      },
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
        ),
      );
}
