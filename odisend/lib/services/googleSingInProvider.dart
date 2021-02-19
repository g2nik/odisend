import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool _signedIn;

  GoogleSignInProvider() {
    _signedIn = false;
  }

  bool get signedIn => _signedIn;

  set signedIn(bool signedIn) {
    _signedIn = signedIn;
    notifyListeners();
  }

  Future logIn() async {
    _signedIn = true;

    final user = await googleSignIn.signIn();

    if (user == null) {
      _signedIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      _signedIn = false;
    }
  }

  void logOut() async {
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    //_signedIn = false;
  }
}
