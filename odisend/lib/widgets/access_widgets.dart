import 'package:flutter/material.dart';
import 'package:odisend/services/googleSingInProvider.dart';
import 'package:provider/provider.dart';

class AccessButton extends StatelessWidget {
  AccessButton({String text, bool retry})
  : this.text = text, this.retry = retry;

  final String text;
  final bool retry;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: BorderSide(color: Colors.orange, width: 3)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("assets/images/google.png", scale: 10),
          Text(text ?? "Sign In with Google", style: TextStyle(color: Colors.orange, fontSize: 16)),
        ],
      ),
      onPressed: () async {
        try {
          final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
          //if (retry) await provider.logOut();
          provider.logIn();
        } catch (e) {
          print(e);
          return;
        }
      },
    );
  }
}