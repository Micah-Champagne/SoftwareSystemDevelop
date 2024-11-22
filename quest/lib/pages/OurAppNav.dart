import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/pages/OurAddBuddy.dart';
import 'package:quest/pages/OurBuddyListAfter.dart';
import 'package:quest/pages/OurBuddyListBefore.dart';
import 'package:quest/pages/OurFriendsPage.dart';
import 'package:quest/pages/OurFriendsPage2.dart';
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
  bool afterAddedBuddy = false;
  bool friendProfile = false;
  int FriendIndex = 0;

  final PageController _pageController = PageController();

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
      addbuddy = false;
      buddylist = false;
      history = false;
      creating = false;
      friendProfile = false;
      _isSwipeDisabled = false;
    });
    _pageController.jumpToPage(index);
  }

  void _navigateToAddBuddy() {
    setState(() {
      _selectedIndex = 2; // Highlight the Profile section
      addbuddy = true;
      _isSwipeDisabled = true;
      afterAddedBuddy = true;
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
      _selectedIndex = 2; // Highlight the Profile section
      history = true;
      _isSwipeDisabled = true;
    });
    _pageController.jumpToPage(5);
    _selectedIndex = 2; // Navigate to the Add Buddy page
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

  void _navigateToFriendsPage(int index) {
    // Add your navigation logic here
    if (_selectedIndex == 2) {
      setState(() {
        _selectedIndex = 2;
        FriendIndex = index;
        friendProfile = true;
      });
      _pageController.jumpToPage(8);
      _selectedIndex = 2;
    }
    else{
    setState(() {
      _selectedIndex = 0;
      FriendIndex = index;
      friendProfile = true;
    });
    _pageController.jumpToPage(7);
    _selectedIndex = 0;}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: friendProfile ?  const Color(0xffCCB3DE) : _OurLightPurple,
        title: Text(
          _selectedIndex == 2
              ? addbuddy
                  ? "Add Buddy"
                  : buddylist
                      ? friendProfile ? "Profile":"Buddy List"
                      : history
                          ? "Quest History"
                          : "Profile"
              : _selectedIndex == 1
                  ? creating
                      ? "Creating Quest"
                      : "Quest Log"
                  : friendProfile ? "Profile" :"Top Questers",
          style: GoogleFonts.lato(fontSize: 35),
        ),
        centerTitle: true,
        leading: addbuddy | buddylist | history | friendProfile// Check if on Add Buddy page
            ? friendProfile ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (_selectedIndex==2)
                  {
                    setState(() {
                      _selectedIndex = 2;
                      friendProfile = false;
                    });
                    _pageController.jumpToPage(4);
                    _selectedIndex = 2; // Navigate back to Profile
                  }
                  else{
                    setState(() {
                      _selectedIndex = 0;
                      friendProfile = false;
                    });
                    _pageController.jumpToPage(0); // Navigate back to Home Page
                  }
                },
              ): IconButton(
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
            DrawerHeader(
                child: Center(
                  child: SvgPicture.asset('assets/icons/qbLandingLogo.svg', height: 100, width: 100, color: _OurCremeColor),
                ),
              ),
            
            ListTile(
              leading: const Icon(Icons.door_back_door),
              title: Text("L O G O U T",
                  style: GoogleFonts.lato(color: const Color(0xfffefdf5))),
              onTap: () {
                Navigator.pushNamed(context, '/logout');
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
          OurHomePage(onGoToBuddy: _navigateToFriendsPage),
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
          afterAddedBuddy
              ?  OurBuddyListAfter(onGoToBuddy: _navigateToFriendsPage)
              :  OurBuddyListBefore(onGoToBuddy: _navigateToFriendsPage),
          const OurHistory(),
          OurCreateQuest(
            BeginQuest: _navigateToBeginQuest,
          ),
          OurFriendsPage(index: FriendIndex),
          OurFriendsPage2(index: FriendIndex)
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
            if (page >= 3) {
              _isSwipeDisabled = true;
            }
          });
        },
      ),
    );
  }
}
