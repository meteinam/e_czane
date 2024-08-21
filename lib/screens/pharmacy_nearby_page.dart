import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:e_czane/widgets/eczane_appbar.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PharmacyNearbyPage extends StatefulWidget {
  const PharmacyNearbyPage({super.key});

  @override
  State<PharmacyNearbyPage> createState() => _PharmacyNearbyPageState();
}

class _PharmacyNearbyPageState extends State<PharmacyNearbyPage> {
  late GoogleMapController mapController;
  static CameraPosition initialPosition =
      const CameraPosition(target: LatLng(41.0082, 28.9784), zoom: 14);
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
    const String apiKey = ''; //add api key here
    final double lat = position.latitude;
    final double lng = position.longitude;
    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&radius=5000&type=pharmacy&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    setState(() {
      markers.clear();
      if (data['status'] == 'OK') {
        for (final place in data['results']) {
          final double lat = place['geometry']['location']['lat'];
          final double lng = place['geometry']['location']['lng'];
          final String name = place['name'];

          markers.add(
            Marker(
                markerId: MarkerId(name),
                position: LatLng(lat, lng),
                infoWindow: InfoWindow(
                  title: name,
                ),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed)),
          );
        }
      }
    });
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
        appBar: EczaneAppbar(
          bgColor: Theme.of(context).colorScheme.primary,
          backButtonPressed: () {
            Navigator.popAndPushNamed(context, '/MyHomePage');
          },
        ),
        widget: GoogleMap(
          initialCameraPosition: initialPosition,
          markers: markers,
          mapType: MapType.normal,
          onMapCreated: (controller) {
            mapController = controller;
          },
        ));
  }
}
