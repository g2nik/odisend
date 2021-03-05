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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: BorderSide(color: Colors.orange, width: 3)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Text(text ?? "Sign In", style: TextStyle(color: Colors.orange, fontSize: 20)),
      onPressed: () async {
        try {
          final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
          if (retry) await provider.logOut();
          provider.logIn();
        } catch (e) {
          print(e);
          return;
        }
      },
    );
  }
}