import 'dart:math';

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
