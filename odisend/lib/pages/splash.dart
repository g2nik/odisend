import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:odisend/access.dart';
import 'package:odisend/pages/login_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Splash extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 214, 165, 1),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[400],
              Colors.orange[300],
              Color.fromRGBO(250, 214, 165, 1),
            ]
          )
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 550.0, left: 100),
              child: _accion(),
            ),
            slide(),
          ]
        ),
      )
    );
  }

  Widget _accion() {
    return Container(
      child: TypewriterAnimatedTextKit(
        text: ["ODISEND"],
        textStyle: TextStyle(
          color: Color.fromRGBO(165, 67, 71, 1),
            fontWeight: FontWeight.bold,
            fontSize: 35.0,
            fontFamily: "Montserrat"
        ),
        textAlign: TextAlign.center,
        alignment: AlignmentDirectional.center // or Alignment.topLeft
      )
    );
  }

  Widget slide() {
    return SizedBox(
      child: AnimatedSplashScreen(
        backgroundColor: Colors.transparent,
        splash: "assets/logo.png",
        nextScreen: Access(),
        //nextScreen: LoginPage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
      )
    );
  }
}
