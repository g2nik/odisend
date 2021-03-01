import 'package:flutter/material.dart';
import 'package:odisend/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:odisend/pages/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(OdisendApp());
}

class OdisendApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Odisend",

      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.cyan,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.cyan,
      ),

      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => Home(),
        "/homex": (BuildContext context) => HomeX(),
      }
    );
  }
}
