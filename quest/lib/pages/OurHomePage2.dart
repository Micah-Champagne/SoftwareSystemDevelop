import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OurHomePage2 extends StatefulWidget {
  const OurHomePage2({super.key});

  @override
  State<OurHomePage2> createState() => _OurHomePage2State();
}

class _OurHomePage2State extends State<OurHomePage2> {
  final Color _OurLightPurple = const Color(0x99838ef4);
  final Color _OurDarkGrey = const Color(0xff262626);
  final Color _OurPurpleBackground = const Color(0xff838ef4);
  final Color _OurCremeColor = const Color(0xfffefdf5);

  final Set<String> _selected = {'T3'};
  final int _selectedSegment = 0;
  final List<String> _allLeaderboardData =
      List.generate(30, (index) => 'Player ${index + 1}');

  final _scrollController1 = ScrollController();
  final _scrollController2 = ScrollController();

  List<String> _getLeaderboardData(int segment) {
    int numberOfItems;
    switch (segment) {
      case 0:
        numberOfItems = 3;
        break;
      case 1:
        numberOfItems = 5;
        break;
      case 2:
        numberOfItems = _allLeaderboardData.length;
        break;
      default:
        numberOfItems = 3;
    }
    return _allLeaderboardData.take(numberOfItems).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _OurCremeColor,
        body: ListView.builder(
            itemCount: 20, // Total number of containers
            itemBuilder: (context, index) {
              if (index == 0) {
                // First container with different style
                return Container(
                    height: 290,
                    width: 200,
                    padding: EdgeInsets.only(top: 10),
                    margin: const EdgeInsets.all(8.0),
                    //padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: _OurCremeColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(children: [
                      const Text(
                        'Top Questers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff262626),
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 50),
                              Container(
                                child: SvgPicture.asset(
                                    "assets/icons/2ndplace.svg",
                                    height: 40,
                                    width: 40),
                              ),
                              SizedBox(height: 7),
                              Container(
                                child: ClipOval(
                                    child: Image.asset(
                                        "assets/icons/arushi.jpeg",
                                        height: 110,
                                        width: 110)),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: SvgPicture.asset(
                                    "assets/icons/crown.svg",
                                    height: 50,
                                    width: 50),
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: ClipOval(
                                    child: Image.asset("assets/icons/abby.jpeg",
                                        height: 150, width: 150)),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 50),
                              Container(
                                child: SvgPicture.asset(
                                    "assets/icons/3rdpalce.svg",
                                    height: 40,
                                    width: 40),
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: ClipOval(
                                    child: Image.asset(
                                        "assets/icons/tyler.jpeg",
                                        height: 110,
                                        width: 110)),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 0.3,
                        width: 375,
                        decoration: BoxDecoration(
                            color: _OurDarkGrey,
                            borderRadius: BorderRadius.circular(5)),
                      )
                    ]));
              } else {
                // Subsequent containers with identical style
                return Container(
                  height: 175,
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: _OurLightPurple,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: _OurDarkGrey),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xff1D1617).withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 5.0)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: ClipOval(
                              child: Image.asset("assets/icons/abby.jpeg",
                                  height: 75, width: 75),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Abby Completed ${index + 1}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Just Now",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 0.3,
                        width: 375,
                        decoration: BoxDecoration(
                            color: _OurDarkGrey,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text("Clean my room",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(width: 175),
                          SvgPicture.asset("assets/icons/checkcircle.svg")
                        ],
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
