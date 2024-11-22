// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Make sure to import this to use SvgPicture
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/models/historymodel.dart';

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

class _OurProfilePageState extends State<OurProfilePage>
    with TickerProviderStateMixin {
  final Color _OurLightPurple = const Color(0x99838ef4);
  final Color _OurDarkGrey = const Color(0xff262626);
  final Color _OurPurpleBackground = const Color(0xff838ef4);
  final Color _OurCremeColor = const Color(0xfffefdf5);
  final Color _OurSelectedTab = const Color(0xffb5baf4);
  final Color _OurNotSelectedTab = const Color(0xffa78fb8);

  final Color _OurGreenPie = const Color(0xffA8E48D);
  final Color _OurYellowPie = const Color(0xfff6e89d);
  final Color _OurBluePie = const Color(0xffA8D8EA);
  final Color _OurPinkPie = const Color(0xffF4C3A5);

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<HistoryModel> HistModel = [];

  @override
  Widget build(BuildContext context) {
    HistModel = HistoryModel.getCategories();
    return Scaffold(
        backgroundColor: _OurCremeColor,
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/icons/Micah.jpeg',
                  height: 100,
                  width: 100,
                ),
              ),
              Container(
                  height: 115,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  )),
              Container(
                height: 150,
                width: 225,
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Micah Champagne",
                        style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text("@ChampagnePapi",
                        style: GoogleFonts.lato(color: Colors.black)),
                    SizedBox(height: 10),
                    Row(children: [
                      CurrentBuddyList(),
                      SizedBox(width: 5),
                      AddBuddyList(),
                      SizedBox(width: 5),
                    ])
                  ],
                ),
              )
            ],
          ),

          //SizedBox(height: 15),
          Container(
            height: 35,
            padding: EdgeInsets.all(3.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: _OurPurpleBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    'My Activity',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Quest History',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
              indicator: BoxDecoration(
                color: _OurSelectedTab,
                borderRadius: BorderRadius.circular(7),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: _OurNotSelectedTab,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              isScrollable: false,
              dividerColor: Colors.transparent,
            ),
          ),

          // TabBarView - the content below the TabBar
          SizedBox(
            height: 436,
            child: TabBarView(controller: _tabController, children: [
              // Content for Section 1
              Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 8.0),
                      child: Text("Point Distribution",
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Image.asset('assets/icons/pichart.jpeg',
                              height: 150),
                        ),
                        SizedBox(width: 30),
                        Expanded(
                          child: Column(
                            //legend section
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: _OurGreenPie),
                                  ),
                                  SizedBox(width: 5),
                                  Text("Professional",
                                      style:
                                          GoogleFonts.lato(color: Colors.black))
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: _OurBluePie),
                                  ),
                                  SizedBox(width: 5),
                                  Text("Educational",
                                      style:
                                          GoogleFonts.lato(color: Colors.black))
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: _OurPinkPie),
                                  ),
                                  SizedBox(width: 5),
                                  Text("Physical",
                                      style:
                                          GoogleFonts.lato(color: Colors.black))
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: _OurYellowPie),
                                  ),
                                  SizedBox(width: 5),
                                  Text("Household",
                                      style:
                                          GoogleFonts.lato(color: Colors.black))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, bottom: 8.0, top: 8),
                      child: Text("Quest Progress",
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    Center(
                      child: Image.asset('assets/icons/LineChart.jpeg',
                          height: 200),
                    ),
                  ])),
              // Content for Section 2
              Center(
                child: ListView.builder(
                  itemCount: HistModel.length + 1, // Total number of containers
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      // First container with different style
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('assets/icons/Barcharts.jpeg'),
                      );
                    } else {
                      // Subsequent containers with identical style
                      return Container(
                        height: 150,
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: HistModel[index - 1]
                                .boxColor, // Adjusted index for HistModel list
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: .5, color: _OurDarkGrey),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color(0xff1D1617).withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 2.0)
                            ]),
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Quest Completed',
                                    style: GoogleFonts.lato(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    HistModel[index - 1]
                                        .time, // Adjusted index for HistModel list
                                    style: GoogleFonts.lato(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 0.3,
                              width: 375,
                              decoration: BoxDecoration(
                                  color: _OurDarkGrey,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 300,
                                  child: Text(
                                    HistModel[index - 1]
                                        .quest, // Adjusted index for HistModel list
                                    softWrap: true,
                                    style: GoogleFonts.lato(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                                const Spacer(),
                                SvgPicture.asset("assets/icons/checkcircle.svg")
                              ],
                            )
                          ],
                        ),
                      );
                    }
                  },
                ),
              )
            ]),
          )
        ]));
  }

  GestureDetector AddBuddyList() {
    return GestureDetector(
      onTap: () {
        widget.onAddBuddy();
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _OurLightPurple,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Center(child: Icon(Icons.add)),
            

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text("Buddies",
                        style: GoogleFonts.lato(color: Colors.black))),
              ],
            ),
          ],
        ),
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
        child: Center(
            child: Text("62 Buddies",
                style: GoogleFonts.lato(color: Colors.black))),
      ),
    );
  }
}
