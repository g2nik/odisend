import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  FirebaseAuth _auth;
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
    try {
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

        _auth = FirebaseAuth.instance;
        await _auth.signInWithCredential(credential);
        _signedIn = false;
      }
    } catch (e) {
      print("Error while logging in: $e");
    }
  }

  String getUID() {
    if (_auth == null) return "token random";
    else {return _auth.currentUser.uid;}
  }

  void logOut() async {
    try {
      await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
      _signedIn = false;
    } catch (e) {
      print("Error while logging out: $e");
    }
  }
}
