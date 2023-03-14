import 'package:bep/MainView/TopNavbar/menu.dart';
import 'package:bep/MainView/TopNavbar/userPoint.dart';
import 'package:bep/MainView/TopNavbar/userProfile.dart';
import 'package:flutter/material.dart';

class topNavbar extends StatelessWidget {
  final String name;
  const topNavbar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          userPoint(),
          Spacer(),
          menu(),
          userProfile(name),
        ],
      ),
    );
  }
}
