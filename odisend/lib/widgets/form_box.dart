import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:odisend/clases/user.dart';
String _password = "", _username = "";

class FormBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
          )
        ],
      ),
      child: buildStack(context),
    );
  }


    Future<User> fetchAlbum() async {
  final response = await http.get('http://g2teamsarria-001-site1.itempurl.com/api/riders');

  if (response.statusCode == 200) {
  List<User> users = jsonDecode(response.body)
      .map((item) => User.fromJson(item))
      .toList()
      .cast<User>();
      debugPrint(_username);
      for (var item in users) {
        if (item .name == _username) {
          if(item.vehicle == _password){
            debugPrint("USER OKK");
          }
        } else {
          debugPrint("USER INVALID");
        }
        debugPrint(item.toString());
      }
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


  Widget buildStack(BuildContext context) {
    return Stack(
      //overflow: Overflow.visible,
      children: <Widget>[
        Container(color: Color.fromRGBO(166, 67, 70, 1), height: 5),
        Column(
          children: <Widget>[
            SizedBox(height: 35),
            Padding(
              padding: EdgeInsets.only(left: 7),
              child: Text(
                'Inicia sesión',
                style: TextStyle(
                    color: Color.fromRGBO(166, 67, 70, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                onChanged: (val) => _username = val,
                cursorColor: Color.fromRGBO(166, 67, 70, 1),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle, color: Color.fromRGBO(166, 67, 70, 1)),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color.fromRGBO(166, 67, 70, 0.5), fontSize: 14),
                    fillColor: Colors.black),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                onChanged: (val) => _password = val,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.security, color:Color.fromRGBO(166, 67, 70, 1)),
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Color.fromRGBO(166, 67, 70, 0.5), fontSize: 14),
                    fillColor: Colors.black),
              ),
            ),
          ],
        ),
        Positioned(
          // top: 280,
          // left: 190,
          top: 270,
          left: MediaQuery.of(context).size.width * .45,
          child: FloatingActionButton(
            onPressed:() => {fetchAlbum()},
            heroTag: 'logintag',
            backgroundColor: Color.fromRGBO(166, 67, 70, 1),
            child: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ],
    );
  }
}