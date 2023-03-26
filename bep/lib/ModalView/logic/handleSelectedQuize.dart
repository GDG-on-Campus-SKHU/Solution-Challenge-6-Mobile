import 'package:bep/Api/mapController.dart';
import 'package:bep/Api/quizeController.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void handleSelectedQuize(
    LatLngBounds bounds, Quize quiz, LatLng latLng, BuildContext context) {
  MapController mapController = MapController();
  print("퀴즈" + quiz.latitude + quiz.longitude);
  if (bounds.contains(latLng)) {
    if (quiz.latitude == latLng.latitude &&
        quiz.longitude == latLng.longitude) {
      print("정답입니다!");
      mapController.onMapTap(context);
    }
  }
}
