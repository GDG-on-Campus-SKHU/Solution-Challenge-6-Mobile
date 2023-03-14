import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bep/Api/quizeController.dart';
import 'package:bep/Api/dioSetting.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bep/ModalView/modalView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapController {
  Dio dio = createDioClient();
  QuizeController quizeController = QuizeController();

  Future<List<Answer>?> onMapTap(
      LatLng tappedPosition, BuildContext context) async {
    // 사용자가 지도를 탭할 때마다 호출됩니다.
    double tappedLatitude = tappedPosition.latitude;
    double tappedLongitude = tappedPosition.longitude;

    List<Quize>? quizes = await quizeController.getQuize();
    if (quizes == null) return null;

    double closestDistance = double.infinity;
    Quize? closestQuiz;

    // 위도 경도 비교하기
    for (var quiz in quizes) {
      String quizLatitude = quiz.latitude;
      String quizLongitude = quiz.longitude;
      double distance = distanceBetween(tappedLatitude, tappedLongitude,
          double.parse(quizLatitude), double.parse(quizLongitude));
      if (distance < closestDistance) {
        closestDistance = distance;
        closestQuiz = quiz;
      }
    }

    // answer 받아오기
    if (closestQuiz != null) {
      try {
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('accessToken');
        dio.options.headers['Authorization'] = 'Bearer $token'; // 인증 토큰 추가

        print(closestQuiz.id);
        var response = await dio.get('/main/${closestQuiz.id}');
        List<dynamic> jsonList = response.data;
        List<Answer> quizAnswer =
            jsonList.map((json) => Answer.fromJson(json)).toList();
        print(response.data);
        print(quizAnswer);
        _openModel(context, quizAnswer);
        return quizAnswer;
      } catch (e) {
        print(e);
      }
    }
    return null;
  }

  void addMarker(Map<MarkerId, Marker> markers, LatLng latLng) {
    final MarkerId markerId =
        MarkerId('marker_id_${DateTime.now().millisecondsSinceEpoch}');

    final Marker marker = Marker(
      markerId: markerId,
      position: latLng,
      infoWindow: InfoWindow(
        title: '마커 타이틀',
        snippet: '마커 스니펫',
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    markers[markerId] = marker;
  }

  double distanceBetween(double startLatitude, double startLongitude,
      double endLatitude, double endLongitude) {
    // 두 지점 간의 거리를 계산합니다.
    double radius = 6371; // 지구의 반지름 (km)
    double dLat = (endLatitude - startLatitude) * (pi / 180);
    double dLon = (endLongitude - startLongitude) * (pi / 180);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(startLatitude * (pi / 180)) *
            cos(endLatitude * (pi / 180)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = radius * c;
    return distance;
  }
}

void _openModel(context, quizAnswer) {
  final _width = MediaQuery.of(context).size.width;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(44.0),
        topRight: Radius.circular(44.0),
      ),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: modalView(_width, context, quizAnswer),
          );
        },
      );
    },
  );
}

class Answer {
  final String question;
  final String category;
  final String content;
  final String imgUrl;

  Answer(
      {required this.question,
      required this.category,
      required this.content,
      required this.imgUrl});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
        question: json['question'],
        category: json['category'],
        content: json['content'],
        imgUrl: json['imgUrl']);
  }

  void toPrint() {
    print("$question, $category, $content, $imgUrl");
  }
}
