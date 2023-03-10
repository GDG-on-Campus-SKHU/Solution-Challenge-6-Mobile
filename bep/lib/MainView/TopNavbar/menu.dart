import 'package:flutter/material.dart';

class menu extends StatelessWidget {
  const menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 16, 0),
        child: Container(
          width: 25,
          height: 25,
          padding: EdgeInsets.zero,
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: 25,
            icon: Image.asset('assets/images/menu.png'),
            onPressed: () {
              print('menu clicked');
            },
          ),
        ),
      ),
    );
  }
}
