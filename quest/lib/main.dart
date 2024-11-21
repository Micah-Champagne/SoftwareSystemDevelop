import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quest/pages/OurAddBuddy.dart';
import 'package:quest/pages/OurAppNav.dart';
import 'package:quest/pages/OurHomePage.dart';
import 'package:quest/pages/OurSignInPage.dart';

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
        theme: ThemeData(
            textTheme:
                GoogleFonts.latoTextTheme(Theme.of(context).primaryTextTheme)),
                
        home: const SignInPage(),
        routes: {
          //'/homepage': (context) => const HomePage2(),
          //'/ourprofilepage': (context) => const OurProfilePage(onAddBuddy: _navigateToAddBuddy,),
          //'/searchpage': (context) => const OurQuestingPage(onPostQuest: () {  },),
          '/testing': (context) => const SignInPage(),
          '/signinpage': (context) => const SignInPage(),
          '/ourappnav': (context) => const OurAppNav(),
          '/ourhomepage2': (context) => const OurHomePage(),
          '/addbuddy': (context) => const OurAddBuddy()
        });
  }
}
