import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showWrongAnswer() {
  Fluttertoast.showToast(
    msg: "틀렸습니다!",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showRightAnswer() {
  Fluttertoast.showToast(
    msg: "정답입니다!",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Color.fromARGB(255, 54, 67, 244),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showMoneyNotEnough() {
  Fluttertoast.showToast(
    msg: "포인트가 부족합니다!",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
