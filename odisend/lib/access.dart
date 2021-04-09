import 'package:flutter/material.dart';
import 'package:odisend/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:odisend/services/googleSingInProvider.dart';
import 'package:odisend/pages/orders.dart';

class Access extends StatefulWidget {
  @override
  _AccessState createState() => _AccessState();
}

class _AccessState extends State<Access> {
  GoogleSignInProvider signInProvider = GoogleSignInProvider();
  LoginPage loginPage = LoginPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => signInProvider,
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {

            if (snapshot.hasData) {

              return FutureBuilder(
                future: signInProvider.isUIDValid(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.hasData) {

                    if (snapshot.data) {
                      return Orders(provider: signInProvider);
                    } else {
                      signInProvider.logOut();
                      return loginPage;
                    }
                    // return snapshot.data
                    // ? Orders(provider: signInProvider)
                    // : loginPage;
                  } else {
                    return Center(
                      child: CircularProgressIndicator()
                    );
                  }
                }
              );
            } else {
              return loginPage;
            }
          }
        ),
      )
    );
  }
}
