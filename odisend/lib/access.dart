import 'package:flutter/material.dart';
import 'package:odisend/services/api.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:odisend/services/googleSingInProvider.dart';
import 'package:odisend/pages/orders.dart';
import 'package:odisend/signIn.dart';

class Access extends StatefulWidget {
  @override
  _AccessState createState() => _AccessState();
}

class _AccessState extends State<Access> {
  API api = API();

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
              return FutureBuilder(
                future: api.tokenIsValid(provider.getUID()),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  print("TOKEN:");
                  print(provider.getUID());
                  if (snapshot.hasData) {
                    return snapshot.data ? Orders(provider: provider) : SignIn();
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              );
            } else {
              return SignIn();
            }
          }
        ),
      )
    );
  }
}
