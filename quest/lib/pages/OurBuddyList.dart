// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OurBuddyList extends StatefulWidget {
  const OurBuddyList({super.key});

  @override
  State<OurBuddyList> createState() => _OurBuddyListState();
}

class _OurBuddyListState extends State<OurBuddyList> {
  final Color _OurLightPurple = const Color(0x99838ef4);

  final Color _OurDarkGrey = const Color(0xff262626);

  final Color _OurPurpleBackground = const Color(0xff838ef4);

  final Color _OurCremeColor = const Color(0xfffefdf5);

  final Color _OurSelectedTab = const Color(0xffb5baf4);

  final Color _OurNotSelectedTab = const Color(0xffa78fb8);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Container(height: 250, width: 250, color: Colors.blue)));
  }
}
