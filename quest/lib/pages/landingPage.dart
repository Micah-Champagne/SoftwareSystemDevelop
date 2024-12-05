// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quest/utils/colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _SignInState();
}

class _SignInState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OurColors().purpleBackground,
      body: GestureDetector(
        onTap: () {
          // Navigate to the next page when the screen is tapped
          Navigator.pushNamed(context, '/onboarding1');
        },
        child: ListView(
          children: [
            const SizedBox(height: 180),
            // SvgPicture.asset("assets/icons/qbLandingLogo.svg",
            //     height: 200, width: 200),
            Image.asset('assets/icons/logo.png', height: 220, width: 220),
          ],
        ),
      ),
    );
  }
}
