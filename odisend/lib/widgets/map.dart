import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:odisend/models/order.dart';

class OdisendMap extends StatefulWidget {
  OdisendMap(this.order);
  final Order order;
  
  // String googleAPIKey = "AIzaSyBWrJpckABVWy6TQH1vZIl4reXSsZ85Muw";
  GoogleMapController controller;
  CameraPosition position;
  Location location;
  LocationData currentLocation;
  LatLng pickupLocation;
  LatLng deliveryLocation;
  Set<Marker> markers = HashSet<Marker>();

  // PolylinePoints polylinePoints;
  // Set<Polyline> polylines = {};
  // List<LatLng> polylineCoordinates = [];

  Future<bool> load() async {
    position = CameraPosition(zoom: 10, target: LatLng(41.41, 2.16));
    pickupLocation = LatLng(41.41693964567262, 2.1874414738691534);
    deliveryLocation = LatLng(41.37683964567262, 2.1264414738691534);
    
    pickupLocation = order.pickupLocation;
    deliveryLocation = order.deliveryLocation;

    markers.add(
      Marker(
        markerId: MarkerId("Pickup"),
        position: pickupLocation,
        infoWindow: InfoWindow(
          title: order.directionPickup,
          snippet: "Pickup"
        )
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("Delivery"),
        position: deliveryLocation,
        infoWindow: InfoWindow(
          title: order.directionDelivery,
          snippet: "Delivery"
        )
      ),
    );

    location = Location();
    currentLocation = await location.getLocation();
    position = CameraPosition(
      zoom: 10,
      target: LatLng(
        currentLocation.latitude,
        currentLocation.longitude
      )
    );

    // PointLatLng origin = PointLatLng(currentLocation.latitude, currentLocation.longitude);
    // PointLatLng destination = PointLatLng(destinationLocation.latitude, currentLocation.longitude);
    //polylinePoints = PolylinePoints();
    // PolylineResult result = await polylinePoints?.getRouteBetweenCoordinates(googleAPIKey, origin, destination);
    // print("RESULT: ${result.status}");
    // print(result.errorMessage);
    // print(result.points);
    // Polyline polyline = Polyline(
    //    polylineId: PolylineId("poly"),
    //    color: Color.fromARGB(255, 40, 122, 198),
    //    points: polylineCoordinates
    // );
    // polylines.add(polyline);
    return true;
  }

  @override
  _OdisendMapState createState() => _OdisendMapState();
}

class _OdisendMapState extends State<OdisendMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: widget.load(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return !snapshot.hasData
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
            initialCameraPosition: widget.position,
            markers: widget.markers,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            //polylines: widget.polylines,
          );
        },
      ),
    );
  }
}