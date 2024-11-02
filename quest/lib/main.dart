import 'package:flutter/material.dart';

import 'package:quest/pages/OurAddBuddy.dart';
import 'package:quest/pages/OurAppNav.dart';
import 'package:quest/pages/OurHomePage.dart';
import 'package:quest/pages/OurHomePage2.dart';
import 'package:quest/pages/OurProfilePage.dart';
import 'package:quest/pages/OurSignInPage.dart';
import 'package:quest/pages/homePage.dart';
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
        home: const SignInPage(),
        routes: {
          '/homepage': (context) => const HomePage2(),
          //'/ourprofilepage': (context) => const OurProfilePage(onAddBuddy: _navigateToAddBuddy,),
          '/searchpage': (context) => const SearchPage(),
          '/testing': (context) => const SignInPage(),
          '/signinpage': (context) => const SignInPage(),
          '/ourappnav' : (context) => const OurAppNav(),
          '/ourhomepage' : (context) => const OurHomePage(),
          '/ourhomepage2' : (context) => const OurHomePage2(),
          '/addbuddy' : (context) => const OurAddBuddy()
        });
  }
}
