import 'package:flutter/material.dart';

Widget donateBtn(context) {
  return Expanded(
    child: Align(
      alignment: Alignment.bottomCenter, //하단 중앙에 정렬
      child: Container(
        margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: ElevatedButton(
            onPressed: () {},
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('assets/images/donation.png'),
              SizedBox(width: 8.0),
              Text('Donate',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ]),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width, 60.0),
              backgroundColor: Color.fromRGBO(54, 123, 183, 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            )),
      ),
    ),
  );
}
