import 'package:google_maps_flutter/google_maps_flutter.dart';

class Order {
  int id;
  String directionDelivery;
  String directionPickup;
  String content;
  int userId;
  int riderId;
  String tokenDelivery;
  String tokenPickup;
  LatLng pickupLocation;
  LatLng deliveryLocation;
  double km;
  double kg;
  String state;

  static Order fromJson(Map<String, dynamic> json) {
    Order newOrder = Order();
    newOrder.id = json["id"];
    newOrder.directionDelivery = json["directionDelivery"];
    newOrder.directionPickup = json["directionPickup"];
    newOrder.content = json["content"];
    newOrder.userId = json["userID"];
    newOrder.riderId = json["riderID"];

    newOrder.tokenPickup = json["tokenPickup"];
    newOrder.tokenDelivery = json["tokenDelivery"];

    String latPickup = json["latPickup"];
    String lngPickup = json["lngPickup"];
    newOrder.pickupLocation = LatLng(double.tryParse(latPickup), double.tryParse(lngPickup));

    String latDelivery = json["latDelivery"];
    String lngDelivery = json["lngDelivery"];
    newOrder.deliveryLocation = LatLng(double.tryParse(latDelivery), double.tryParse(lngDelivery));

    newOrder.km = json["km"];
    newOrder.kg = json["kg"];
    newOrder.state = json["state"] ?? "N/A";
    return newOrder;
  }
}