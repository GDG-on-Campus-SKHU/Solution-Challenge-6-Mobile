import 'package:bep/MainView/globalButton.dart';
import 'package:bep/MainView/quizeCardContainer.dart';
import 'package:bep/MainView/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:bep/ModalView/modalView.dart';
import 'package:google_sign_in/google_sign_in.dart';

class mainView extends StatefulWidget {
  final GoogleSignInAccount googleUser;
  const mainView({super.key, required this.googleUser});

  @override
  _mainViewState createState() => _mainViewState();
}

class _mainViewState extends State<mainView> {
  static final LatLng _kMapCenter = LatLng(37.485172, 126.783173);
  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 10.0, tilt: 0, bearing: 0);
  late GoogleMapController _controller;

  bool _isQuizeOpen = false;
  Map<MarkerId, Marker> _markers = {};

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _controller.setMapStyle(value);
  }

  void _addMarker(LatLng latLng) {
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

    setState(() {
      _markers[markerId] = marker;
    });
  }

  void _openModel(context) {
    final _width = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: this.context,
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
              child: modalView(_width, context),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kInitialPosition,
            onMapCreated: onMapCreated,
            myLocationButtonEnabled: false,
            markers: _markers.values.toSet(),
            onTap: (latLng) {
              _addMarker(latLng);
              _openModel(context);
              print('$latLng');
            },
          ),
          SafeArea(
            child: Stack(
              children: [
                userProfile(widget.googleUser.displayName.toString()),
                globalButton(
                  isQuizeOpen: _isQuizeOpen,
                  onToggleActive: (value) {
                    setState(() {
                      _isQuizeOpen = value;
                    });
                  },
                ),
                quizeCardContainer(isQuizeOpen: _isQuizeOpen),
              ],
            ),
          )
        ],
      ),
    );
  }
}
