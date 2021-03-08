import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:odisend/models/order.dart';
import 'package:odisend/models/user.dart';

class API {

  final String baseUrl = "http://g2teamsarria-001-site1.itempurl.com/api/";
  var headers = { "Content-Type" : "application/json" };

  Future<bool> tokenIsValid(String localToken) async {
    var response = await http.get(baseUrl + "users");
    Iterable apiTokens = json.decode(response.body);
    var users = List<User>.from(apiTokens.map((model)=> User.fromJson(model)));
    for (User u in users) if (localToken == u.token) return true;
    return false;
  }
  
  Future<List<Order>> getOrders() async {
    var response = await http.get(baseUrl + "tasks");
    Iterable apiOrders = json.decode(response.body);
    return List<Order>.from(apiOrders.map((model)=> Order.fromJson(model)));
  }

  Future<List<Order>> getGeneralOrders() async {
    var orders = await getOrders();
    orders.removeWhere((element) => element.asigned);
    return orders;
  }

  Future<List<Order>> getAssignedOrders() async {
    var orders = await getOrders();
    orders.removeWhere((element) => element.riderId != 1);
    return orders;
  }

  Future uploadToken(int id, Map<String, dynamic> json) async {
    var response = await http.put(
      baseUrl + "users/$id",
      headers: headers,
      body: jsonEncode(json),
    );
    return response;
  }
}