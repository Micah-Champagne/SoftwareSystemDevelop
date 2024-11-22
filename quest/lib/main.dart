import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quest/pages/OurAddBuddy.dart';
import 'package:quest/pages/OurAppNav.dart';
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
                color: Colors.black,
                
        home: const SignInPage(),
        routes: {
          //'/homepage': (context) => const HomePage2(),
          //'/ourprofilepage': (context) => const OurProfilePage(onAddBuddy: _navigateToAddBuddy,),
          //'/searchpage': (context) => const OurQuestingPage(onPostQuest: () {  },),
          '/logout': (context) => const SignInPage(),
          //'/testing': (context) => const OurFriendsPage(),
          '/ourappnav': (context) => const OurAppNav(),
          //'/ourhomepage2': (context) => const OurHomePage(onGoToBuddy: _navigateToFriendsPage,),
          '/addbuddy': (context) => const OurAddBuddy()
        });
  }
}
