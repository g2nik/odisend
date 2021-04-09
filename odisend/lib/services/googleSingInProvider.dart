import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:odisend/services/api.dart';
import 'package:odisend/services/preferences.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  API api = API();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _signedIn;
  String _uid;

  GoogleSignInProvider() {
    _signedIn = false;
    _uid = "";
  }

  bool get signedIn => _signedIn;

  String get uid => _uid;

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
        _uid = _auth.currentUser.uid;
        _signedIn = false;
      }
    } catch (e) {
      print("Error while logging in: $e");
    }
  }

  Future<bool> isUIDValid() async {
    await logIn();
    await api.getRiderIdGoogle(_uid);
    return await api.tokenIsValid(_uid);
  }

  Future logOut() async {
    try {
      await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
      _signedIn = false;
    } catch (e) {
      print("Error while logging out: $e");
    }
  }
}
