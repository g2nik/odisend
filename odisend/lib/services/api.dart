import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:odisend/models/order.dart';
import 'package:odisend/models/rider.dart';
import 'package:odisend/models/user.dart';
import 'package:odisend/services/preferences.dart';

class API {

  Preferences _prefs = Preferences();

  // Future<bool> tokenIsValid(String localToken) async {
  //   var response = await http.get("http://g2teamsarria-001-site1.itempurl.com/api/users");
  //   Iterable apiTokens = json.decode(response.body);
  //   var users = List<User>.from(apiTokens.map((model)=> User.fromJson(model)));
  //   for (User u in users) if (localToken == u.token) return true;
  //   return false;
  // }
  
  Future<bool> tokenIsValid(String localToken) async {
    var response = await http.get("http://g2teamsarria-001-site1.itempurl.com/api/riders");
    Iterable apiRiders = json.decode(response.body);
    var riders = List<Rider>.from(apiRiders.map((model)=> Rider.fromJson(model)));
    for (Rider r in riders) {
      if (localToken == r.token) {
        _prefs.setRiderId(r.id);
        _prefs.setSignedIn(true);
        return true;
      }
    }
    return false;
  }

  Future<int> getRiderIdGoogle(String localToken) async {
    var response = await http.get("http://g2teamsarria-001-site1.itempurl.com/api/riders");
    Iterable apiRiders = json.decode(response.body);
    var riders = List<Rider>.from(apiRiders.map((model)=> Rider.fromJson(model)));
    for (Rider r in riders) {
      if (localToken == r.token) {
        _prefs.setRiderId(r.id);
        _prefs.setSignedIn(true);
        print("YOUR RIDER ID IS: ${r.id}");
        return r.id;
      }
    }
    return 1;
  }

  Future<Rider> getRiderInfo() async {
    int riderId = await _prefs.getRiderId();
    var response = await http.get("http://g2teamsarria-001-site1.itempurl.com/api/riders/$riderId");
    print(response.body);
    return Rider.fromJson(json.decode(response.body));
  }
  
  Future<List<Order>> getOrders() async {
    var response = await http.get("http://g2teamsarria-001-site1.itempurl.com/api/tasks");
    Iterable apiOrders = json.decode(response.body);
    return List<Order>.from(apiOrders.map((model)=> Order.fromJson(model)));
  }

  Future<List<Order>> getGeneralOrders() async {
    var orders = await getOrders();
    orders.removeWhere((element) => element.riderId != 1);
    return orders;
  }

  Future<List<Order>> getAssignedOrders() async {
    int riderId = await _prefs.getRiderId();
    var orders = await getOrders();
    for (Order o in orders) {
      print(o.id);
      print(o.riderId);
      print("**");
    }
    orders.removeWhere((element) => element.riderId != riderId ?? 1);
    return orders;
  }

  Future uploadToken(int id, Map<String, dynamic> json) async {
    var response = await http.put(
      "http://g2teamsarria-001-site1.itempurl.com/api/users/$id",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(json),
    );
  }

  void takeOrder(Order order) async {
    int riderId = await _prefs.getRiderId();
    var response = await http.put(
      "http://g2teamsarria-001-site1.itempurl.com/api/tasks/${order.id}",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({

        "id": order.id,
        "directionDelivery": order.directionDelivery,
        "directionPickup": order.directionPickup,
        "content": order.content,
        "userID": order.userId,
        "riderID": riderId,
        
        "tokenPickup": order.tokenPickup,
        "tokenDelivery": order.tokenDelivery,
        "lngPickup": order.pickupLocation.longitude,
        "latPickup": order.pickupLocation.latitude,
        "lngDelivery":order.deliveryLocation.longitude,
        "latDelivery": order.deliveryLocation.latitude,
        "km": order.km,
        "kg": order.kg,
        "state": order.state
      })
    );
    print(jsonDecode(response.body));
  }
}