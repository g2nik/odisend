class User {
  int id;
  String name;
  String token;
  String direction;
  String username;
  String passsword;
  String vehicle;
  int mobile;

  static User fromJson(Map<String, dynamic> json) {
    User newUser = User();
    newUser.id = json["id"];
    newUser.name = json["name"];
    newUser.token = json["token"];
    newUser.direction = json["direction"];
    newUser.mobile = json["mobile"];
    newUser.username = json["login"];
    newUser.passsword = json["password"];
    newUser.vehicle = json["vehicle"];
    return newUser;
  }
}