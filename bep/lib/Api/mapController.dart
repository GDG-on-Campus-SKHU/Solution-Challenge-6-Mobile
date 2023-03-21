import 'package:bep/Api/answer.dart';
import 'package:bep/ModalView/logic/distanceBetween.dart';
import 'package:bep/ModalView/logic/openModal.dart';
import 'package:flutter/material.dart';
import 'package:bep/Api/quizeController.dart';
import 'package:bep/Api/dioSetting.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapController {
  Dio dio = createDioClient();
  static List<Quize> quize = [];

  Future<List<Answer>?> onMapTap(BuildContext context) async {
    // answer 받아오기
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');
      dio.options.headers['Authorization'] = 'Bearer $token'; // 인증 토큰 추가

      var response = await dio.get('/main/${quize.first.id}');
      final data = response.data;

      Answer quizAnswer = Answer.fromJson(data);
      openModal(context, quizAnswer);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
