import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:odisend/pages/login_page.dart';
import 'package:odisend/pages/orders.dart';
import 'package:odisend/pages/signup_page.dart';
import 'package:odisend/pages/splash.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(OdisendApp());
}

class OdisendApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        accentColor: Colors.orangeAccent,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        accentColor: Colors.orangeAccent,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Odisend",
        theme: theme,
        darkTheme: darkTheme,
        initialRoute: "/",
        routes: {
          "/": (BuildContext context) => Splash(),
          "/login": (BuildContext context) => LoginPage(),
          "/signup" : (BuildContext context) => SignupPage(),
          "/orders": (BuildContext context) => Orders(),
        }
      )
    );
    // return MaterialApp( 
    //   debugShowCheckedModeBanner: false,
    //   title: "Odisend",

    //   theme: ThemeData(
    //     brightness: Brightness.light,
    //     primarySwatch: Colors.cyan,
    //   ),

    //   darkTheme: ThemeData(
    //     brightness: Brightness.dark,
    //     primarySwatch: Colors.cyan,
    //   ),

    //   home: Splash(),
    // );
  }
}
