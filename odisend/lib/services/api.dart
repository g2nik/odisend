import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:odisend/models/order.dart';

class API {
  Future<List<Order>> getTasks() async {
    List<Order> orders;

    var response = await http.get("http://g2teamsarria-001-site1.itempurl.com/api/tasks");
    print(response.body);
    // var x = jsonDecode(response.body);

    // orders=(json.decode(response.body) as List).map((i) =>
    //           Order.fromJson(i)).toList();

    // for(dynamic e in x) {
    //   print(e + "\n");
    // }
  }
}