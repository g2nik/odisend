import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:odisend/models/order.dart';
import 'package:odisend/models/rider.dart';
import 'package:odisend/models/user.dart';
import 'package:odisend/services/preferences.dart';

class API {

  Preferences _prefs = Preferences();

  Future<bool> tokenIsValid(String localToken) async {
    var response = await http.get("http://g2teamsarria-001-site1.itempurl.com/api/users");
    Iterable apiTokens = json.decode(response.body);
    var users = List<User>.from(apiTokens.map((model)=> User.fromJson(model)));
    for (User u in users) if (localToken == u.token) return true;
    return false;
  }

  Future<int> getRiderId(String localToken) async {
    var response = await http.get("http://g2teamsarria-001-site1.itempurl.com/api/riders");
    Iterable apiRiders = json.decode(response.body);
    var riders = List<Rider>.from(apiRiders.map((model)=> Rider.fromJson(model)));
    for (Rider r in riders) {
      print(r.id);
      print(r.name);
      print(r.token);
      if (localToken == r.token) {
        //await _prefs.setRiderId(r.id);
        return r.id;
      }
    }
    return 1;
  }
  
  Future<List<Order>> getOrders() async {
    var response = await http.get("http://g2teamsarria-001-site1.itempurl.com/api/tasks");
    Iterable apiOrders = json.decode(response.body);
    return List<Order>.from(apiOrders.map((model)=> Order.fromJson(model)));
  }

  Future<List<Order>> getGeneralOrders() async {
    var orders = await getOrders();
    orders.removeWhere((element) => element.asigned);
    return orders;
  }

  Future<List<Order>> getAssignedOrders() async {
    int riderId = await _prefs.getRiderId();
    var orders = await getOrders();
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

  void takeOrder(Order order, int riderId) async {
    var response = await http.put(
      "http://g2teamsarria-001-site1.itempurl.com/api/tasks/${order.id}",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": order.id,
        "direction_Delivery": order.direction_Delivery,
        "direction_Pickup": order.direction_Pickup,
        "content": order.content,
        "userID": order.userId,
        "riderID": riderId,
        "asigned": true,
        "state": order.state
      })
    );
    print(jsonDecode(response.body));
  }
}