import 'package:bep/Api/quizeController.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void handleSelectedQuize(LatLngBounds bounds, Quize quiz, LatLng latLng) {
  if (bounds.contains(latLng)) {
    if (quiz.latitude == latLng.latitude &&
        quiz.longitude == latLng.longitude) {
      print("정답입니다!");
      // 정답 처리 로직 추가
    } else {
      print("오답입니다.");
      // 오답 처리 로직 추가
    }
  } else {
    print("바운더리를 벗어났습니다.");
    // 바운더리 벗어남 처리 로직 추가
  }
}
