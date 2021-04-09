class Rider {
  int id;
  String name;
  int mobile;
  String vehicle;
  String token;
  String login;
  String passsword;

  static Rider fromJson(Map<String, dynamic> json) {
    Rider newRider = Rider();
    newRider.id = json["id"];
    newRider.name = json["name"];
    newRider.mobile = json["mobile"];
    newRider.vehicle = json["vehicle"];
    newRider.token = json["token"];
    newRider.login = json["login"];
    newRider.passsword = json["password"];
    return newRider;
  }
}