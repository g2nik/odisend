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
    newOrder.content = json["content"];
    newOrder.directionDelivery = json["directionDelivery"];
    newOrder.directionPickup = json["directionPickup"];
    newOrder.userId = json["userID"];
    newOrder.riderId = json["riderID"];

    String pLat = json["LatPickup"];
    String pLng = json["LngPickup"];
    newOrder.pickupLocation = LatLng(double.tryParse(pLat), double.tryParse(pLng));

    String dLat = json["LatDelivery"];
    String dLng = json["LngDelivery"];
    newOrder.deliveryLocation = LatLng(double.tryParse(dLat), double.tryParse(dLng));

    newOrder.km = json["KM"];
    newOrder.kg = json["KG"];
    newOrder.state = json["State"] ?? "N/A";
    return newOrder;
  }
}