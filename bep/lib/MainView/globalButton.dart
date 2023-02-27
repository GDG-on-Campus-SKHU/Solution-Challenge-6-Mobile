import 'package:flutter/material.dart';

class globalButton extends StatelessWidget {
  final bool isQuizeOpen;
  final ValueChanged<bool> onToggleActive;

  globalButton({
    required this.isQuizeOpen,
    required this.onToggleActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 16, 16),
        child: IconButton(
          iconSize: 40,
          icon: Image.asset('assets/images/global.gif'),
          onPressed: () {
            onToggleActive(!isQuizeOpen);
          },
        ),
      ),
    );
  }
}
