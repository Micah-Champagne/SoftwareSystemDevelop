// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Make sure to import this to use SvgPicture
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/models/post_model.dart';
import 'package:quest/utils/colors.dart';
import 'package:quest/utils/history_bar_chart.dart';
import 'package:quest/utils/radial_bar_chart.dart';
import 'package:quest/utils/splinechart1.dart';

class ProfilePage extends StatefulWidget {
  final VoidCallback onAddBuddy;
  final VoidCallback onBuddyList;
  final bool afterPosted;
  final bool afteraddbuddy;

  const ProfilePage(
      {super.key,
      required this.onAddBuddy,
      required this.onBuddyList,
      required this.afterPosted,
      required this.afteraddbuddy});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  List<PostModel> posts = [];
  List<PostModel> selectedPosts = [];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    if (widget.afterPosted) {
      posts = PostModel.getAfterCategories();
    } else {
      posts = PostModel.getBeforeCategories();
    }

    String selectedUser = "ChampagnePapi";
    selectedPosts =
        posts.where((post) => post.username == selectedUser).toList();
  }

  void toggleFavorite(int index) {
    setState(() {
      if (selectedPosts[index].isFavorited) {
        selectedPosts[index].likedAmount -= 1;
        selectedPosts[index].isFavorited = false;
      } else {
        selectedPosts[index].likedAmount += 1;
        selectedPosts[index].isFavorited = true;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OurColors().cremeColor,
      body: Column(children: [
        ProfileHeader(),
        Container(
          height: 30,
          padding: EdgeInsets.all(3.0),
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: OurColors().purpleBackground,
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
              color: OurColors().selectedTab,
              borderRadius: BorderRadius.circular(7),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            unselectedLabelColor: OurColors().notSelectedTab,
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
            MyActivityTab(),
            MyQuestHistoryTab(),
          ]),
        ),
      ]),
    );
  }

  Row ProfileHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
          child: ClipOval(
            child: Image.asset(
              'assets/icons/Micah.jpeg',
              height: 100,
              width: 100,
            ),
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
    );
  }

  Center MyQuestHistoryTab() {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: selectedPosts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: HistoryBarChart()
                      //Image.asset('assets/icons/Barcharts.jpeg'),
                      );
                } else {
                  return MyHistory(index);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Center MyActivityTab() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text("Point Distribution",
                style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Row(
            children: [
              RadialBarChart(),
              SizedBox(width: 20),
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
                              color: OurColors().greenPie),
                        ),
                        SizedBox(width: 5),
                        Text("Professional",
                            style: GoogleFonts.lato(color: Colors.black))
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
                              color: OurColors().bluePie),
                        ),
                        SizedBox(width: 5),
                        Text("Educational",
                            style: GoogleFonts.lato(color: Colors.black))
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
                              color: OurColors().pinkPie),
                        ),
                        SizedBox(width: 5),
                        Text("Physical",
                            style: GoogleFonts.lato(color: Colors.black))
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
                              color: OurColors().yellowPie),
                        ),
                        SizedBox(width: 5),
                        Text("Household",
                            style: GoogleFonts.lato(color: Colors.black))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 8),
            child: Row(
              children: [
                Text("Quest Progress",
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(width: 10),
                        Row(
                          children:[
                            Row(
                              children: [
                                Container(
                                height: 20,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: OurColors().lightPurple),
                                ),
                                SizedBox(width: 5,),
                                Text("December", style: GoogleFonts.lato(color: Colors.black)),
                              ],
                            ),
                            SizedBox(width: 10),
                            Row(
                              children: [Container(
                            height: 20,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff7C678A),),
                            ),
                            SizedBox(width: 5),
                            Text("November", style: GoogleFonts.lato(color: Colors.black))],
                            )
                          ]
                        )
              ],
            ),
          ),
          Center(
              //child: Image.asset('assets/icons/LineChart.jpeg', height: 190),
              child: Container(child: SplineChart1())),
        ],
      ),
    );
  }

  Container MyHistory(int index) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: selectedPosts[index - 1].boxColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: .5, color: OurColors().darkGrey),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2.0)
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: OurColors().darkGrey)),
                child: ClipOval(
                  child: Image.asset(
                    selectedPosts[index - 1].image,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      '${selectedPosts[index - 1].username} Completed',
                      softWrap: true,
                      style: TextStyle(
                          color: OurColors().darkGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    selectedPosts[index - 1].time,
                    style: TextStyle(color: OurColors().darkGrey, fontSize: 16),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              Text(selectedPosts[index - 1].quest,
                  style: TextStyle(color: OurColors().darkGrey, fontSize: 20)),
              const Spacer(),
              SvgPicture.asset("assets/icons/checkcircle.svg")
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 0.1,
            width: 325,
            decoration: BoxDecoration(
                color: OurColors().darkGrey,
                borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => toggleFavorite(index - 1),
                child: AnimatedScale(
                  scale: 1.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Icon(
                      selectedPosts[index - 1].isFavorited
                          ? Icons.favorite
                          : Icons.favorite_border,
                      key: ValueKey<bool>(selectedPosts[index - 1].isFavorited),
                      color: selectedPosts[index - 1].isFavorited
                          ? Colors.red
                          : OurColors().darkGrey,
                      size: 25,
                    ),
                  ),
                ),
              ),
              Text(
                selectedPosts[index - 1].likedAmount.toString(),
                style: GoogleFonts.lato(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
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
          color: OurColors().lightPurple,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
          color: OurColors().lightPurple,
        ),
        child: Center(
            child: widget.afteraddbuddy
                ? Text("64 Buddies",
                    style: GoogleFonts.lato(color: Colors.black))
                : Text("62 Buddies",
                    style: GoogleFonts.lato(color: Colors.black))),
      ),
    );
  }
}
