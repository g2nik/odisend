import 'package:flutter/material.dart';
import 'package:odisend/services/googleSingInProvider.dart';
import 'package:provider/provider.dart';

class ProfileDetails extends StatefulWidget {
  ProfileDetails({GoogleSignInProvider provider}) : googleProvider = provider;

  GoogleSignInProvider googleProvider;

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
          FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: Colors.cyan, width: 3)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Text("Sign Out"),
          onPressed: () {
            widget.googleProvider.logOut();
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }
}