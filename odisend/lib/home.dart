import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:odisend/pages/home.dart';
import 'package:odisend/services/googleSingInProvider.dart';
import 'package:odisend/signIn.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {

            final provider = Provider.of<GoogleSignInProvider>(context);

            if(provider.signedIn) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return HomeX();
            } else {
              return SignIn();
            }
          }
        ),
      )
    );
  }
}
