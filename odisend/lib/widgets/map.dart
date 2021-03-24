import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:odisend/models/order.dart';

class OdisendMap extends StatefulWidget {
  OdisendMap(this.order);
  final Order order;
  
  GoogleMapController controller;
  CameraPosition position = CameraPosition(zoom: 5, target: LatLng(1, 1));

  @override
  _OdisendMapState createState() => _OdisendMapState();
}

class _OdisendMapState extends State<OdisendMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        initialCameraPosition: widget.position,
        
      ),
    );
  }
}