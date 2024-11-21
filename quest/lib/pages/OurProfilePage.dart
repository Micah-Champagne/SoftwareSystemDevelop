// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OurProfilePage extends StatefulWidget {
  final VoidCallback onAddBuddy;
  final VoidCallback onBuddyList;
  final VoidCallback onHistory;

  const OurProfilePage(
      {super.key,
      required this.onAddBuddy,
      required this.onBuddyList,
      required this.onHistory});

  @override
  State<OurProfilePage> createState() => _OurProfilePageState();
}

class _OurProfilePageState extends State<OurProfilePage> {
  final Color _OurLightPurple = const Color(0x99838ef4);

  final Color _OurDarkGrey = const Color(0xff262626);

  final Color _OurPurpleBackground = const Color(0xff838ef4);

  final Color _OurCremeColor = const Color(0xfffefdf5);

  final Color _OurSelectedTab = const Color(0xffb5baf4);

  final Color _OurNotSelectedTab = const Color(0xffa78fb8);
  bool _leftTabSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _OurCremeColor,
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/icons/Micah.jpeg',
                    height: 125,
                    width: 125,
                  ),
                ),
                Container(
                    height: 150,
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    )),
                Container(
                  //color: Colors.red,
                  height: 175,
                  width: 225,
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Micah Champagne",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("@ChampagnePapi"),
                      SizedBox(height: 10),
                      Row(children: [
                        CurrentBuddyList(),
                        SizedBox(width: 5),
                        AddBuddyList(),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            widget.onHistory();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _OurLightPurple,
                            ),
                            child: Center(child: Icon(Icons.history)),
                          ),
                        )
                      ])
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Stack(children: [
              Container(
                height: 600,
                width: 375,
                color: _OurCremeColor,
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Row(children: [
                    SizedBox(width: 12.5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _leftTabSelected = true;
                        });
                      },
                      child: Container(
                          width: 175,
                          height: 50,
                          decoration: BoxDecoration(
                              color: _leftTabSelected
                                  ? _OurSelectedTab
                                  : _OurNotSelectedTab,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Text("Statistics"))),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _leftTabSelected = false;
                        });
                      },
                      child: Container(
                          width: 175,
                          height: 50,
                          decoration: BoxDecoration(
                              color: _leftTabSelected
                                  ? _OurNotSelectedTab
                                  : _OurSelectedTab,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Text("Metrics"))),
                    )
                  ])),
              Positioned(
                  top: 35,
                  left: 12.5,
                  child: Container(
                      width: 350,
                      height: 500,
                      decoration: BoxDecoration(
                          //color: Colors.white,
                          color: Color(0xffb5baf4),
                          borderRadius: BorderRadius.circular(10)),
                      child:
                          _leftTabSelected ? StatisticsTab() : MetricsTab())),
            ])
          ]),
        ));
  }

  GestureDetector AddBuddyList() {
    return GestureDetector(
      onTap: () {
        widget.onAddBuddy();
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _OurLightPurple,
        ),
        child: Center(child: Icon(Icons.add)),
      ),
    );
  }

  GestureDetector CurrentBuddyList() {
    return GestureDetector(
      onTap: () {
        widget.onBuddyList();
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _OurLightPurple,
        ),
        child: Center(child: Text("62 Buddies")),
      ),
    );
  }
}

class StatisticsTab extends StatelessWidget {
  const StatisticsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Center(
                          child: SizedBox(
                              height: 100,
                              width: 275,
                              child: Text('Quests Completed',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 35,
                                      decoration: TextDecoration.underline)))),
                      Center(
                          child: SizedBox(
                              height: 50,
                              width: 275,
                              child: Text('35',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 45,
                                      decoration: TextDecoration.underline)))),
                    ],
                  ),
                ),
                Container(
                  height: .5,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                ),

                Column(
                  children: [
                    Center(
                        child: SizedBox(
                            height: 100,
                            width: 200,
                            child: Text('Points Earned',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 35,
                                )))),
                    Center(
                        child: SizedBox(
                            height: 50,
                            width: 200,
                            child: Text('74',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 45,
                                )))),
                  ],
                )
              ]),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: Container(height: 5, width: 175, color: Color(0xff9b81ad)))
      ],
    );
  }
}

class MetricsTab extends StatelessWidget {
  const MetricsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("All Quests",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    )),
                SvgPicture.asset(
                  'assets/icons/AllQuestsMetrics.svg',
                ),
                SizedBox(height: 20),
                Text("Eduational Quests",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    )),
                SvgPicture.asset(
                  'assets/icons/AllQuestsMetrics.svg',
                ),
                SizedBox(height: 20),
                Text("Professional Quests",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    )),
                SvgPicture.asset(
                  'assets/icons/AllQuestsMetrics.svg',
                ),
                SizedBox(height: 20),
                Text("Household Quests",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    )),
                SvgPicture.asset(
                  'assets/icons/AllQuestsMetrics.svg',
                ),
                SizedBox(height: 20),
                Text("Physical Quests",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    )),
                SvgPicture.asset(
                  'assets/icons/AllQuestsMetrics.svg',
                ),
              ],
            ),
          )), //height: 20, width: 20,)),
          //Text('Metrics Content', style: TextStyle(fontSize: 24)))),
          Positioned(
              top: 0,
              left: 0,
              child: Container(height: 5, width: 175, color: Color(0xff9b81ad)))
        ],
      ),
    );
  }
}
