import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationBtn extends StatefulWidget {
  @override
  State<DonationBtn> createState() => _DonationBtnState();
}

class _DonationBtnState extends State<DonationBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: () {
            print("\$1 Donate");
          },
          child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text('\$1 Donated'),
                  GestureDetector(
                    onTap: () {
                      Uri uri = Uri.parse(
                          'https://paypal.me/jiseon0212?country.x=KR&locale.x=ko_KR');
                      launchUrl(uri);
                    },
                    child: Image.asset(
                      'assets/images/paypal-donate-button.png',
                      width: 200,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ))),
    );
  }
}
