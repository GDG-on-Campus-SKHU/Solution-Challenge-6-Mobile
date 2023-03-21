import 'package:bep/Api/quizeController.dart';
import 'package:bep/ModalView/logic/distanceBetween.dart';

void handleSelectedQuize(Quize quiz, double latitude, double longitude) {
  double closestDistance = double.infinity;
  double distance = distanceBetween(latitude, longitude,
      double.parse(quiz.latitude), double.parse(quiz.longitude));
  if (distance < closestDistance) {
    closestDistance = distance;
  }
}
