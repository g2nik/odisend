import 'package:flutter/material.dart';
import 'package:odisend/models/profile.dart';
import 'package:odisend/widgets/widgets.dart';

class ProfileDetails extends StatefulWidget {
  //ProfileDetails(this.profile);
  //final Profile profile;

  @override _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFILE DETAILS"),
      ),
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 30),
          Text(
            "USER ID",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 30),
          Text(
            "NAME",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 40),
          Text(
            "PASSWORD",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 40),
          Text(
            "VEHICLE",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}