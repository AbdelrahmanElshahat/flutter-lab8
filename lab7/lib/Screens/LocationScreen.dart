import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lab7/models/users.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MapSample extends StatefulWidget {
  Geo User_loc;
  MapSample({this.User_loc});
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition initLocation;
  static final CameraPosition _kLake = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Void initState() {
    super.initState();
    initLocation = CameraPosition(
      target: LatLng(
        double.parse(widget.User_loc.lat),
        double.parse(widget.User_loc.lng),
      ),
      zoom: 14.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initLocation,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: showLocation,
        label: Text('Show Location'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  showLocation() {
    MapsLauncher.launchCoordinates(
      double.parse(widget.User_loc.lat),
      double.parse(widget.User_loc.lng),
    );
  }
}
