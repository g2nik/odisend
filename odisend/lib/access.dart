import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:odisend/pages/home.dart';
import 'package:odisend/services/googleSingInProvider.dart';
import 'package:odisend/signIn.dart';
import 'package:provider/provider.dart';

class Access extends StatefulWidget {
  @override
  _AccessState createState() => _AccessState();
}

class _AccessState extends State<Access> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {

            final provider = Provider.of<GoogleSignInProvider>(context);

            if (snapshot.hasData) {
              return Home(provider: provider);
            } else {
              return SignIn();
            }
          }
        ),
      )
    );
  }
}
