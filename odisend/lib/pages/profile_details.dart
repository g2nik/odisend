import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:odisend/services/googleSingInProvider.dart';

class ProfileDetails extends StatefulWidget {
  ProfileDetails({GoogleSignInProvider provider}) : googleProvider = provider;

  final GoogleSignInProvider googleProvider;

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 20),
            child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color: Colors.orange, width: 3)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Text("Sign Out"),
            onPressed: () {
              widget.googleProvider.logOut();
              Navigator.pop(context);
            }),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
            child: Switch(
              value: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light,
              onChanged: (bool value) {
                setState(() => AdaptiveTheme.of(context).toggleThemeMode());
              },
            ),
          )
        ],
      ),
    );
  }
}