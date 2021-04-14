import 'package:flutter/material.dart';
import 'package:odisend/services/googleSingInProvider.dart';
import 'package:odisend/services/preferences.dart';
import 'package:provider/provider.dart';

class AccessButton extends StatelessWidget {
  Preferences _prefs = Preferences();

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
          Text("Sign In with Google", style: TextStyle(color: Colors.orange, fontSize: 16)),
        ],
      ),
      onPressed: () async {
        try {
          final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
          bool signedIn = await _prefs.getSignedIn();
          print("Signed in? $signedIn");
          if (signedIn == true) {
            await provider.logOut();
          }
          bool uidvalid = await provider.isUIDValid();
        } catch (e) {
          print(e);
          return;
        }
      },
    );
  }
}