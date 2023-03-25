import 'package:bep/DonationView/ui/donationStatue.dart';
import 'package:flutter/material.dart';
import 'loginView.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {
        '/DonationStatus': (context) => DonationStatus(),
      },
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      title: 'BeP',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: null,
        body: new LoginView(),
      ),
    );
  }
}
