// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quest/utils/colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _SignInState();
}

class _SignInState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    // Delay the navigation by 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the next page after 2 seconds
      Navigator.pushNamed(context, '/onboarding1');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: OurColors().purpleBackground,
        body: ListView(children: [
          const SizedBox(height: 148),
          SvgPicture.asset("assets/icons/qbLandingLogo.svg",
              height: 200, width: 200),
          
        ]));
  }
}
