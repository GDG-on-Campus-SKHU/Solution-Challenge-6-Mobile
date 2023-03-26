import 'package:google_maps_flutter/google_maps_flutter.dart';

void addMarker(Map<MarkerId, Marker> markers, LatLng latLng) {
  print(markers);
  final MarkerId markerId = MarkerId('marker_id_${DateTime.now().millisecondsSinceEpoch}');

  final Marker marker = Marker(
    markerId: markerId,
    position: latLng,
    infoWindow: InfoWindow(
      title: '마커 타이틀',
      snippet: '마커 스니펫',
    ),
    icon: BitmapDescriptor.defaultMarker,
  );

  markers.clear();

  markers[markerId] = marker;
}
