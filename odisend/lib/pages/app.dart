import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:odisend/pages/orders.dart';
import 'login_page.dart';
import 'signup_page.dart';

class App extends StatelessWidget {
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
          '/signup' : (BuildContext context) => SignupPage(),
          "/": (BuildContext context) => LoginPage(),
          "/orders": (BuildContext context) => Orders(),
        }
      )
    );
  }
}
