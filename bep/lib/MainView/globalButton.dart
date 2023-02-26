import 'package:flutter/material.dart';

class globalButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 16, 16),
        child: IconButton(
          iconSize: 40,
          icon: Image.asset('assets/global.gif'),
          onPressed: () {},
        ),
      ),
    );
  }
}
