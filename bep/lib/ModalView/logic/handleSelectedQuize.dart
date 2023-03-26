import 'dart:math';

import 'package:bep/Api/mapController.dart';
import 'package:bep/Api/quizeController.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const earthRadius = 6371.0; // 지구 반지름(km)

Future<bool>? handleSelectedQuiz(
    Quiz quiz, LatLng latLng, BuildContext context, int id, Future<void> Function() getPoint) {
  MapController mapController = MapController();
  var distance =
      haversine(double.parse(quiz.latitude), double.parse(quiz.longitude), latLng.latitude, latLng.longitude);
  if (distance < 100000) {
    return mapController.onMapTap(context, id, getPoint);
  }
  return null;
}

double haversine(double lat1, double lon1, double lat2, double lon2) {
  // 각도를 라디안으로 변환
  final lat1Rad = lat1 * (pi / 180.0);
  final lon1Rad = lon1 * (pi / 180.0);
  final lat2Rad = lat2 * (pi / 180.0);
  final lon2Rad = lon2 * (pi / 180.0);

  // 위도와 경도의 차이 계산
  final deltaLat = lat2Rad - lat1Rad;
  final deltaLon = lon2Rad - lon1Rad;

  // Haversine 공식 계산
  final a = pow(sin(deltaLat / 2), 2) + cos(lat1Rad) * cos(lat2Rad) * pow(sin(deltaLon / 2), 2);
  final c = 2 * asin(sqrt(a));
  final distance = earthRadius * c * 1000; // 미터 단위로 변환하여 반환
  return distance;
}
