import 'package:bep/Api/answer.dart';
import 'package:bep/ModalView/logic/distanceBetween.dart';
import 'package:bep/ModalView/logic/openModal.dart';
import 'package:flutter/material.dart';
import 'package:bep/Api/quizeController.dart';
import 'package:bep/Api/dioSetting.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapController {
  Dio dio = createDioClient();
  double closestDistance = double.infinity;
  static List<Quize> quize = [];
  Quize quiz = quize[0];

  void handleSelectedQuize(Quize quiz, double latitude, double longitude) {
    double distance = distanceBetween(latitude, longitude,
        double.parse(quiz.latitude), double.parse(quiz.longitude));
    if (distance < closestDistance) {
      closestDistance = distance;
    }
  }

  Future<List<Answer>?> onMapTap(
      LatLng tappedPosition, BuildContext context) async {
    // 사용자가 지도를 탭할 때마다 호출됩니다.
    double tappedLatitude = tappedPosition.latitude;
    double tappedLongitude = tappedPosition.longitude;

    handleSelectedQuize(quiz, tappedLatitude, tappedLongitude);
    // answer 받아오기
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');
      dio.options.headers['Authorization'] = 'Bearer $token'; // 인증 토큰 추가

      var response = await dio.get('/main/${quiz.id}');
      final data = response.data;

      Answer quizAnswer = Answer.fromJson(data);
      openModal(context, quizAnswer);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
