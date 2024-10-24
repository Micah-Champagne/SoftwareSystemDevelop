import 'package:flutter/material.dart';
import 'package:quest/pages/AppNav.dart';
import 'package:quest/pages/SignInPage.dart';
import 'package:quest/pages/loginPage.dart';
import 'package:quest/pages/homePage.dart';
import 'package:quest/pages/profilePage.dart';
import 'package:quest/pages/searchPage.dart';

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
        home: SignInPage(),
        routes: {
          '/firstpage': (context) => const AppNav(),
          '/homepage': (context) => const HomePage(),
          '/loginpage': (context) => const LoginPage(),
          '/profilepage': (context) => const ProfilePage(),
          '/searchpage': (context) => const SearchPage(),
          '/testing': (context) => SignInPage(),
          '/signinpage': (context) => SignInPage()
        });
  }
}
