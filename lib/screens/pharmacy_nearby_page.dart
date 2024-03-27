import 'dart:convert';

import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class PharmacyNearbyPage extends StatefulWidget {
  const PharmacyNearbyPage({super.key});

  @override
  State<PharmacyNearbyPage> createState() => _PharmacyNearbyPageState();
}

class _PharmacyNearbyPageState extends State<PharmacyNearbyPage> {
  late GoogleMapController mapController;
  static CameraPosition _initialPosition =
      CameraPosition(target: LatLng(41.0082, 28.9784), zoom: 14);
  Set<Marker> markers = {};
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("location permisson is denied forever");
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation().then((position) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 14)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return EczaneScaffold(
        widget: Container(
            child: GoogleMap(
      initialCameraPosition: _initialPosition,
      markers: markers,
      mapType: MapType.normal,
      onMapCreated: (controller) {
        mapController = controller;
      },
    )));
  }
}
