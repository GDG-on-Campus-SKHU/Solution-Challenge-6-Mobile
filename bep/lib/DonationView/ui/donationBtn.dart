import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text('\$1 Donated'),
                  Image.asset(
                    'assets/images/paypal-donate-button.png',
                    width: 200,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                ],
              ))),
    );
  }
}
