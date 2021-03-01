import 'package:flutter/material.dart';
import 'package:odisend/services/googleSingInProvider.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Colors.orange, width: 3)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Text("Sign In", style: TextStyle(color: Colors.orange, fontSize: 20)),
          onPressed: () {
            try {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logIn();
            } catch (e) {
              print(e);
              return;
            }
          },
        ),
      ),
    );
  }
}