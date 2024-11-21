import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/pages/OurAddBuddy.dart';
import 'package:quest/pages/OurBuddyList.dart';
import 'package:quest/pages/OurHistory.dart';
import 'package:quest/pages/OurHomePage.dart';
import 'package:quest/pages/OurProfilePage.dart';
import 'package:quest/pages/OurQuestingPage.dart';
import 'package:quest/utils/my_button.dart';
import 'package:quest/pages/OurCreateQuest.dart';

class OurAppNav extends StatefulWidget {
  const OurAppNav({super.key});

  @override
  State<OurAppNav> createState() => _OurAppNavState();
}

class _OurAppNavState extends State<OurAppNav> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final Color _OurLightPurple = const Color(0x99838ef4);
  final Color _OurDarkGrey = const Color(0xff262626);
  final Color _OurPurpleBackground = const Color(0xff838ef4);
  final Color _OurCremeColor = const Color(0xfffefdf5);

  int _selectedIndex = 0;
  bool addbuddy = false;
  bool buddylist = false;
  bool history = false;
  bool creating = false;
  bool _isSwipeDisabled = false;

  final PageController _pageController = PageController();

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
      addbuddy = false;
      buddylist = false;
      history = false;
      creating = false;
      _isSwipeDisabled = false;
    });
    _pageController.jumpToPage(index);
  }

  void _navigateToAddBuddy() {
    setState(() {
      _selectedIndex = 2; // Highlight the Profile section
      addbuddy = true;
      _isSwipeDisabled = true;
    });
    _pageController.jumpToPage(3);
    _selectedIndex = 2; // Navigate to the Add Buddy page
  }

  void _navigateToBuddyList() {
    setState(() {
      _selectedIndex = 2; // Highlight the Profile section
      buddylist = true;
      _isSwipeDisabled = true;
    });
    _pageController.jumpToPage(4);
    _selectedIndex = 2; // Navigate to the Add Buddy page
  }

  void _navigateToHistory() {
    setState(() {
      _selectedIndex = 1; // Highlight the Profile section
      history = true;
      _isSwipeDisabled = true;
    });
    _pageController.jumpToPage(5);
    _selectedIndex = 1; // Navigate to the Add Buddy page
  }

  void _navigateToCreateQuest() {
    setState(() {
      _selectedIndex = 1; // Highlight the Profile section
      creating = true;
      _isSwipeDisabled = true;
    });
    _pageController.jumpToPage(6);
    _selectedIndex = 1;
  }

  void _navigateToPostQuest() {
    setState(() {
      _selectedIndex = 0;
      _pageController.jumpToPage(0);
      _isSwipeDisabled = false;
    });
  }

  void _navigateToBeginQuest() {
    setState(() {
      _selectedIndex = 0;
      _pageController.jumpToPage(0);
      _isSwipeDisabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: _OurLightPurple,
        title: Text(
          _selectedIndex == 2
              ? addbuddy
                  ? "Add Buddy"
                  : buddylist
                      ? "Buddy List"
                      : history
                          ? "Questing History"
                          : "Profile"
              : _selectedIndex == 1
                  ? creating
                      ? "Creating Quest"
                      : "Completing Quests"
                  : "Top Questers",
          style: GoogleFonts.inika(fontSize: 35),
        ),
        centerTitle: true,
        leading: addbuddy | buddylist | history // Check if on Add Buddy page
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                    addbuddy = false;
                    buddylist = false;
                    history = false;
                  });
                  _pageController.jumpToPage(2); // Navigate back to Profile
                },
              )
            : creating
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                        creating = false;
                      });
                      _pageController.jumpToPage(1); // Navigate back to Profile
                    },
                  )
                : IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      _scaffoldKey.currentState
                          ?.openDrawer(); // Open the drawer
                    },
                  ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(250, 38, 38, 38),
        child: Column(
          children: [
            const DrawerHeader(
              child: Text(
                "QUEST BUDDY",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("S E T T I N G S",
                  style: TextStyle(color: Color(0xfffefdf5))),
            ),
            ListTile(
              leading: const Icon(Icons.door_back_door),
              title: const Text("L O G O U T",
                  style: TextStyle(color: Color(0xfffefdf5))),
              onTap: () {},
            ),
            MyButton(
              text: "testPage",
              onPressed: () {
                Navigator.pushNamed(context, '/testing');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 0.4,
            color: const Color(0xFF262626),
          ),
          BottomNavigationBar(
            backgroundColor: _OurCremeColor,
            elevation: 10,
            currentIndex: _selectedIndex,
            onTap: _navigateBottomBar,
            items: [
              BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? SvgPicture.asset("assets/icons/feedfilled.svg")
                    : SvgPicture.asset("assets/icons/feedblank.svg"),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? SvgPicture.asset("assets/icons/addfilled.svg")
                    : SvgPicture.asset("assets/icons/addblank.svg"),
                label: "Quests",
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? SvgPicture.asset("assets/icons/profilefilled.svg")
                    : SvgPicture.asset("assets/icons/profileblank.svg"),
                label: "Profile",
              ),
            ],
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: _isSwipeDisabled
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        children: [
          const OurHomePage(),
          OurQuestingPage(
            onCreateQuest: _navigateToCreateQuest,
            onPostQuest: _navigateToPostQuest,
          ),
          OurProfilePage(
            onAddBuddy: _navigateToAddBuddy,
            onBuddyList: _navigateToBuddyList,
            onHistory: _navigateToHistory,
          ), // Pass the callback without const
          const OurAddBuddy(),
          const OurBuddyList(),
          const OurHistory(),
          OurCreateQuest(
            BeginQuest: _navigateToBeginQuest,
          )
        ],
        onPageChanged: (page) {
          setState(() {
            if (page == 0) {
              _selectedIndex = 0;
            } else if (page == 1 || page == 6) {
              _selectedIndex = 1;
            } else if (page >= 2 && page <= 5) {
              _selectedIndex = 2;
            }
            if(page >=3){
            _isSwipeDisabled = true;}
          });
        },
      ),
    );
  }
}
