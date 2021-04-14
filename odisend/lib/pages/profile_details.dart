import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:odisend/models/rider.dart';
import 'package:odisend/pages/login_page.dart';
import 'package:odisend/pages/splash.dart';
import 'package:odisend/services/api.dart';
import 'package:odisend/services/googleSingInProvider.dart';

class ProfileDetails extends StatefulWidget {
  ProfileDetails({GoogleSignInProvider provider}) : googleProvider = provider;
  final GoogleSignInProvider googleProvider;

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  API api = API();
  
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFILE DETAILS"),
      ),
      body: FutureBuilder(
        future: api.getRiderInfo(),
        builder: (context, AsyncSnapshot<Rider> snapshot) {
          return !snapshot.hasData
          ? Center(child: CircularProgressIndicator())
          : ListView(
            children: [
              SizedBox(height: 30),
              Text(
                "ID: ${snapshot.data.id}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.grey, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 30),
              Text(
                snapshot.data.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 30),
              Text(
                snapshot.data.vehicle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dark Mode",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                  Switch(
                    activeColor: Colors.orangeAccent,
                    value: AdaptiveTheme.of(context).mode != AdaptiveThemeMode.light,
                    onChanged: (bool value) {
                      setState(() => AdaptiveTheme.of(context).toggleThemeMode());
                    },
                  ),
                ],
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
                  if (widget.googleProvider != null) widget.googleProvider.logOut();
                  print("google log out");
                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()),);
                }),
              ),
            ],
          );
        }
      ),
    );
  }
}