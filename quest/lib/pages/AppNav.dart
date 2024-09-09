import 'package:flutter/material.dart';
import 'package:quest/pages/homePage.dart';
import 'package:quest/pages/profilePage.dart';
import 'package:quest/pages/searchPage.dart';
import 'package:quest/utils/addQuestDialog.dart';
import 'package:quest/utils/completeQuestDialog.dart';
import 'package:quest/utils/logoutDialog.dart';
import 'package:quest/utils/my_button.dart';

class AppNav extends StatefulWidget {
  const AppNav({super.key});

  @override
  State<AppNav> createState() => _AppNavState();
}

class _AppNavState extends State<AppNav> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  final List _pages = [
    //home page
    const HomePage(),
    //search page
    const SearchPage(),
    //profile page
    const ProfilePage()
  ];

  void logout() {
    showDialog(
        context: context,
        builder: (context) {
          return const LogoutDiaglog();
        });
  }

  void addQuest() {
    showDialog( 
      context: context,
      builder: (context) {
        return const Addquestdialog();
      }
    );
  }

  void completeQuest() {
    showDialog( 
      context: context,
      builder: (context) {
        return const Completequestdialog();
      }
    );
  }

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('QuestBuddy',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600)),
          backgroundColor: Colors.blue[200],
          centerTitle: true,
          actions: [
            PopupMenuButton<int>(
              icon: Icon(Icons.add),
              onSelected: (int result) {
                if (result == 0) {
                  print("addQuestBranch");
                  addQuest();
                } else {
                  completeQuest();
                  print("CompleteQuestBranch");
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("Add a new Quest")),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text("Complete a Quest"))
              ]
            )
            
          ],
        ),
        drawer: Drawer(
            backgroundColor: Colors.purple[100],
            child: Column(children: [
              const DrawerHeader(
                  child: Text("QB",
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w600,
                      ))),
              const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("S E T T I N G S")),
              ListTile(
                leading: const Icon(Icons.door_back_door),
                title: const Text("L O G O U T"),
                onTap: logout,
              ),
              MyButton(
                  text: "testPage",
                  onPressed: () {
                    Navigator.pushNamed(context, '/testing');
                  })
            ], 
            ),
            
            ),
        
        bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            currentIndex: _selectedIndex,
            onTap: _navigateBottomBar,
            items: const [
              //home
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              //search
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              //profile
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile")
            ]),
        body: PageView(
            controller: _pageController,
            children: const <Widget>[
              HomePage(),
              SearchPage(),
              ProfilePage(),
            ],
            onPageChanged: (page) {
              setState(() {
                _selectedIndex = page;
              });
            }));
  }
  
  void QuestDropDown() {

  }
}
