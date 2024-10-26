import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OurHomePage extends StatefulWidget {
  const OurHomePage({super.key});

  @override
  State<OurHomePage> createState() => _OurHomePageState();
}

class _OurHomePageState extends State<OurHomePage> {
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
        backgroundColor: _OurPurpleBackground,
        body: ListView.builder(
            itemCount: 20, // Total number of containers
            itemBuilder: (context, index) {
              if (index == 0) {
                // First container with different style
                return Container(
                    height: 300,
                    width: 200,
                    margin: const EdgeInsets.all(8.0),
                    //padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: _OurPurpleBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(children: [
                      const Text(
                        'Top Questers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          
                          Column(
                            children: [
                              ClipOval(
                                child: Image.asset('assets/icons/Micah.jpeg', height: 50, width: 50,),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 75, width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.green,)
                              )
                            ],
                          ),Column(
                            children: [
                              ClipOval(
                                child: Image.asset('assets/icons/Micah.jpeg', height: 50, width: 50,),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 125, width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.pink),
                              )
                            ],
                          ),Column(
                            children: [
                              ClipOval(
                                child: Image.asset('assets/icons/Micah.jpeg', height: 50, width: 50,),
                              ),const SizedBox(height: 10),
                              Container(
                                height: 200, width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.red),
                              )
                            ],
                          ),Column(
                            children: [
                              ClipOval(
                                child: Image.asset('assets/icons/Micah.jpeg', height: 50, width: 50,),
                              ),const SizedBox(height: 10),
                              Container(
                                height: 100, width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.orange),
                              )
                            ],
                          ),Column(
                            children: [
                              ClipOval(
                                child: Image.asset('assets/icons/Micah.jpeg', height: 50, width: 50,),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 50, width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.blue),
                              )
                            ],
                          )
                        ],
                      ),
                    ]));
              } else {
                // Subsequent containers with identical style
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Container ${index + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              }
            }));
  }
}
