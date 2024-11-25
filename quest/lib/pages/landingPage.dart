// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quest/utils/colors.dart';

class landingPage extends StatefulWidget {
  const landingPage({super.key});

  @override
  State<landingPage> createState() => _SignInState();
}

class _SignInState extends State<landingPage> {

      @override
  void initState() {
    super.initState();
    // Delay the navigation by 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the next page after 2 seconds
      Navigator.pushNamed(context, '/signinPage');
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: OurColors().purpleBackground,
        body: ListView(
          children: [
          const SizedBox(height: 150),
          SvgPicture.asset("assets/icons/qbLandingLogo.svg",
              height: 200, width: 200),
          Image.asset(
            "assets/icons/name.jpeg",
            height: 80,
            
          ),
        ]));
  }
}
