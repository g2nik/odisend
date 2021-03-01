class Order {
  int id;
  String content;
  String direction_Delivery;
  String direction_Pickup;
  int userId;
  int riderId;
  bool asigned;
  String state;

  fromJson(Map<String, dynamic> json) {
    id = json["id"];
    content = json["content"];
    direction_Delivery = json["direction_Delivery"];
    direction_Pickup = json["direction_Pickup"];
    userId = json["userId"];
    riderId = json["riderId"];
    asigned = json["asigned"];
    state = json["state"] ?? "N/A";
  }
  
}