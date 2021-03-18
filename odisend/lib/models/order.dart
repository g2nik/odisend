class Order {
  int id;
  String content;
  String direction_Delivery;
  String direction_Pickup;
  int userId;
  int riderId;
  bool asigned;
  String state;

  static Order fromJson(Map<String, dynamic> json) {
    Order newOrder = Order();
    newOrder.id = json["id"];
    newOrder.content = json["content"];
    newOrder.direction_Delivery = json["direction_Delivery"];
    newOrder.direction_Pickup = json["direction_Pickup"];
    newOrder.userId = json["userId"];
    newOrder.riderId = json["riderId"];
    newOrder.asigned = json["asigned"];
    newOrder.state = json["state"] ?? "N/A";
    return newOrder;
  }
}