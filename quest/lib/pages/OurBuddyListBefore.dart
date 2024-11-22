// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/models/buddyListModel1.dart';

class OurBuddyListBefore extends StatefulWidget {
  final Function(int) onGoToBuddy;
  const OurBuddyListBefore({super.key, required this.onGoToBuddy});

  @override
  State<OurBuddyListBefore> createState() => _OurBuddyListBeforeState();
}

class _OurBuddyListBeforeState extends State<OurBuddyListBefore> {
  final Color _OurLightPurple = const Color(0x99838ef4);

  final Color _OurDarkGrey = const Color(0xff262626);

  final Color _OurPurpleBackground = const Color(0xff838ef4);

  final Color _OurCremeColor = const Color(0xfffefdf5);

  final Color _OurSelectedTab = const Color(0xffb5baf4);

  final Color _OurNotSelectedTab = const Color(0xffa78fb8);

  List<BuddyListModel1> buddies = [];
  @override
  Widget build(BuildContext context) {
    buddies = BuddyListModel1.getCategories();
    return Scaffold(
        body: ListView.builder(
            itemCount: buddies.length + 1,
            itemBuilder: (context, index) {
              // Subsequent containers with identical style
              if (index == 0) {
                return Container(
                    margin: EdgeInsets.only(
                        left: 25, top: 25, right: 25, bottom: 15),
                    //padding: EdgeInsets.all(5),

                    decoration: BoxDecoration(
                      //color: Color(0xffECE6F0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      style: GoogleFonts.lato(color: Colors.black),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 232, 219, 240),
                          contentPadding: const EdgeInsets.all(15),
                          hintText: 'Search by Username',
                          hintStyle: GoogleFonts.lato(
                              color: Color(0x66262626), fontSize: 14),
                          suffixIcon: SizedBox(
                            width: 100,
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const VerticalDivider(
                                    color: Colors.black,
                                    indent: 10,
                                    endIndent: 10,
                                    thickness: 0.1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.search,
                                        color: Color(0x66262626)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none)),
                    ));
              } else {
                return Container(
                  height: 70,
                  margin: EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: ClipOval(
                              child: Image.asset(buddies[index - 1].image,
                                  height: 50, width: 50, fit: BoxFit.cover)),
                        ),
                        Container(
                            height: 50,
                            width: 225,
                            decoration: BoxDecoration(
                                color: _OurLightPurple,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(buddies[index - 1].name,
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.lato(
                                          color: Colors.black)),
                                ],
                              ),
                            )),
                        GestureDetector(
                          onTap: () {
                            widget.onGoToBuddy(index - 1);
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: _OurLightPurple,
                                  borderRadius: BorderRadius.circular(20)),
                              child: SizedBox(
                                height: 35,
                                width: 35,
                                child: Icon(Icons.arrow_right_alt),
                              )),
                        )
                      ]),
                );
              }
            }));
  }
}
