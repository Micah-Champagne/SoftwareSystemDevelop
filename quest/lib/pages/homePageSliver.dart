import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  Set<String> _selected = {'T3'};
  int _selectedSegment = 0;
  final List<String> _allLeaderboardData =
      List.generate(30, (index) => 'Player ${index + 1}');

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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 415.0,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 22.0),
                      child: Text(
                        "Leaderboard",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CupertinoSegmentedControl<int>(
                          children: {
                            0: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Top 3"),
                            ),
                            1: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Top 5"),
                            ),
                            2: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("All Friends"),
                            ),
                          },
                          groupValue: _selectedSegment,
                          onValueChanged: (int? newValue) {
                            if (newValue != null) {
                              setState(() {
                                _selectedSegment = newValue;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 300.0, // Adjust height as needed
                      child: ListView(
                        children: _getLeaderboardData(_selectedSegment)
                            .map((player) => ListTile(title: Text(player)))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Text(
                  "Sliver",
                  style: TextStyle(fontSize: 600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
