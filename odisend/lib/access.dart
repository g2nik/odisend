import 'package:flutter/material.dart';
import 'package:odisend/pages/login_page.dart';
import 'package:odisend/widgets/access_widgets.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => signInProvider,
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {

            //final provider = Provider.of<GoogleSignInProvider>(context);

            if (snapshot.hasData) {

              return FutureBuilder(
                future: signInProvider.isUIDValid(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data
                    ? Orders(provider: signInProvider)
                    : LoginPage();
                    // : Center(
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.all(32.0),
                    //         child: Text(
                    //           "Your account is not registered in our database",
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(fontSize: 20),
                    //         ),
                    //       ),
                    //       AccessButton(text: "Sign In again", retry: true)
                    //     ]
                    //   ),
                    // );
                  } else {
                    return Center(
                      child: CircularProgressIndicator()
                    );
                  }
                }
              );
            } else {
              return LoginPage();
            }
          }
        ),
      )
    );
  }
}
