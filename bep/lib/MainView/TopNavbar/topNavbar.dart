import 'package:bep/MainView/TopNavbar/menu.dart';
import 'package:bep/MainView/TopNavbar/userPoint.dart';
import 'package:bep/MainView/TopNavbar/userProfile.dart';
import 'package:flutter/material.dart';

class topNavbar extends StatelessWidget {
  final String name;
  final int point;
  const topNavbar({super.key, required this.name, required this.point});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          userPoint(point: point),
          Spacer(),
          menu(),
          userProfile(name),
        ],
      ),
    );
  }
}
