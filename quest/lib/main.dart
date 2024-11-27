import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/pages/appNav.dart';
import 'package:quest/pages/landingPage.dart';
import 'package:quest/pages/onboardingPage.dart';
import 'package:quest/pages/signInPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                GoogleFonts.latoTextTheme(Theme.of(context).primaryTextTheme)),
                color: Colors.black,
                
        home: const LandingPage(),
        routes: {
          '/landingpage': (context) => const LandingPage(),
          '/onboarding1': (context) => const OnboardingPg1(),
          '/onboarding2': (context) => const OnboardingPg2(),
          '/onboarding3': (context) => const OnboardingPg3(),
          '/signinPage': (context) => const SignInPage(),
          '/logout': (context) => const SignInPage(),
          '/ourappnav': (context) => const AppNav(),
          

        });
  }
}
