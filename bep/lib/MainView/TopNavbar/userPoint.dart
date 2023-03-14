import 'package:flutter/material.dart';

class userPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
      child: Container(
        width: 140,
        height: 32,
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(56, 0, 0, 0),
              blurRadius: 2,
              blurStyle: BlurStyle.normal,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 5, 0, 0),
              child: Container(
                width: 23,
                height: 22,
                child: Image.asset('assets/images/heart-attack.png'),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 4, 8, 0),
              child: Text(
                '1000p',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
