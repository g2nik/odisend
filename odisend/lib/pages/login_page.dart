import 'package:flutter/material.dart';
import 'package:odisend/widgets/access_widgets.dart';
import '../widgets/form_box.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation1, animation2, animation3;
  AccessButton accessButton = AccessButton();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    
    animation1 = Tween(begin: -1.0, end: 0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.bounceInOut));

    animation2 = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(.50, 1.0, curve: Curves.fastOutSlowIn)));

    animation3 = Tween(begin: 1.0, end: 0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(.4, 1.0, curve: Curves.fastOutSlowIn)));
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
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
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SizedBox(height: _height * 0.15),
                  Transform(
                    transform: Matrix4.translationValues(
                        0, animation2.value * _height, 0),
                    child: Text(
                      'BIENVENIDO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:Color.fromRGBO(166, 67, 70, 1),
                        fontSize: 25,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Transform(
                    transform: Matrix4.translationValues(
                        animation1.value * _width, 0, 0),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: _width * 0.15, right: _width * 0.15),
                      height: 350,
                      child: FormBox(),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(0, animation3.value * _height, 0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 50),
                      child: accessButton,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
