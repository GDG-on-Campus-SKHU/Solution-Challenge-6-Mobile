import 'package:flutter/material.dart';
import 'loginView.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BeP',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: new LoginView(),
    );
  }
}
