import 'package:flutter/material.dart';
import 'package:quest/pages/first.dart';
import 'package:quest/pages/home.dart';
import 'package:quest/pages/loginScreen.dart';
import 'package:quest/pages/profile.dart';
import 'package:quest/pages/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        routes: {
          '/firstpage': (context) => FirstPage(),
          '/homepage': (context) => HomePage(),
          '/loginpage': (context) => LoginPage(),
          '/profilepage': (context) => ProfilePage(),
          '/searchpage': (context) => SearchPage()
        });
  }
}
