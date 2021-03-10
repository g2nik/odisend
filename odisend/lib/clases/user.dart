
class User {
  final int id;
  final String name;
  final int mobile;
  final String vehicle;
  

  User({this.id, this.name, this.mobile, this.vehicle});


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      vehicle: json['vehicle'],
    );
  }
}