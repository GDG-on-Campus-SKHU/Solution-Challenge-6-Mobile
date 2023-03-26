import 'package:bep/Api/quizeController.dart';
import 'package:bep/MainView/TopNavbar/topNavbar.dart';
import 'package:bep/MainView/globalButton.dart';
import 'package:bep/MainView/quizeCardContainer.dart';
import 'package:bep/ModalView/logic/addMarker.dart';
import 'package:bep/ModalView/logic/handleSelectedQuize.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';

class mainView extends StatefulWidget {
  final GoogleSignInAccount googleUser;
  const mainView({super.key, required this.googleUser});

  @override
  _mainViewState createState() => _mainViewState();
}

class _mainViewState extends State<mainView> {
  static final LatLng _kMapCenter = LatLng(37.485172, 126.783173);
  static final LatLngBounds _kMapBounds = LatLngBounds(
    southwest: LatLng(37.433877, 126.711254),
    northeast: LatLng(37.542186, 126.855916),
  );
  static final CameraPosition _kInitialPosition = CameraPosition(target: _kMapCenter, zoom: 10.0, tilt: 0, bearing: 0);

  late GoogleMapController _controller;
  int selectedId = -1;
  Map<MarkerId, Marker> _markers = {};
  QuizeController quizeController = QuizeController();

  List<Quize> quizes = [];
  bool _isQuizeOpen = false;

  initState() {
    super.initState();
    _getQuize();
  }

  void _updateSelectedId(int id) {
    setState(() {
      selectedId = id;
    });
  }

  Future<void> _getQuize() async {
    final response = await quizeController.getQuize();
    setState(() {
      quizes = response!;
    });
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    _controller.animateCamera(CameraUpdate.newLatLngBounds(_kMapBounds, 0));
  }

  Future<void> _onCardSelected(Quize quize, LatLng latLng) async {
    handleSelectedQuize(quize, latLng, context, quizes[selectedId].id);

    print(quizes[selectedId].question);
    setState(() {
      addMarker(_markers, latLng);
    });
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
              selectedId >= 0 ? _onCardSelected(quizes[selectedId], latLng) : null;
            },
          ),
          SafeArea(
            child: Stack(
              children: [
                topNavbar(name: widget.googleUser.displayName.toString()[0]),
                globalButton(
                  isQuizeOpen: _isQuizeOpen,
                  onToggleActive: (value) {
                    setState(() {
                      _isQuizeOpen = value;
                    });
                  },
                ),
                quizeCardContainer(
                  updateSelectedId: _updateSelectedId,
                  isQuizeOpen: _isQuizeOpen,
                  quizes: quizes,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
