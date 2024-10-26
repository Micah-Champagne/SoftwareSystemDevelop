import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quest/pages/OurHomePage2.dart';
import 'package:quest/pages/profilePage.dart';
import 'package:quest/pages/searchPage.dart';
import 'package:quest/utils/my_button.dart';

class OurAppNav extends StatefulWidget {
  const OurAppNav({super.key});

  @override
  State<OurAppNav> createState() => _OurAppNavState();
}

class _OurAppNavState extends State<OurAppNav> {
  final Color _OurLightPurple = const Color(0x99838ef4);
  final Color _OurDarkGrey = const Color(0xff262626);
  final Color _OurPurpleBackground = const Color(0xff838ef4);
  final Color _OurCremeColor = const Color(0xfffefdf5);

  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  final List _pages = [
    //home page
    const OurHomePage2(),
    //search page
    const SearchPage(),
    //profile page
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          backgroundColor: _OurLightPurple,
          title: const Text(
            "QB",
            style: TextStyle(fontSize: 35),
          ),
          centerTitle: true,
        ),

        drawer: Drawer(
          backgroundColor: const Color.fromARGB(250, 38, 38, 38),
          
          child: Container(
            child: Column(
              children: [
                const DrawerHeader(
                    child: Text("QUEST BUDDY",
                    textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            color: Colors.white))),
                const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("S E T T I N G S", style: TextStyle(color: Color(0xfffefdf5)),)),
                ListTile(
                    leading: const Icon(Icons.door_back_door),
                    title: const Text("L O G O U T",  style: TextStyle(color: Color(0xfffefdf5))),
                    onTap: () {}),
                MyButton(
                    text: "testPage",
                    onPressed: () {
                      Navigator.pushNamed(context, '/testing');
                    })
              ],
            ),
          ),
        ),

        bottomNavigationBar: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children:[
            Container(
              height: 0.4,
              color: Color(0xFF262626)
            ),
          BottomNavigationBar(
              elevation: 10,
              currentIndex: _selectedIndex,
              onTap: _navigateBottomBar,
              items: [
                //home
                BottomNavigationBarItem(
                    icon: _selectedIndex == 0
                        ? SvgPicture.asset("assets/icons/feedfilled.svg")
                        : SvgPicture.asset("assets/icons/feedblank.svg"),
                    label: "Home"),
                //search
                BottomNavigationBarItem(
                    icon: _selectedIndex == 1
                        ? SvgPicture.asset("assets/icons/addfilled.svg")
                        : SvgPicture.asset("assets/icons/addblank.svg"),
                    label: "Quests"),
                //profile
                BottomNavigationBarItem(
                    icon: _selectedIndex == 2
                        ? SvgPicture.asset("assets/icons/profilefilled.svg")
                        : SvgPicture.asset("assets/icons/profileblank.svg"),
                    label: "Profile")
              ]),]
        ),

        body: PageView(
            controller: _pageController,
            children: const <Widget>[
              OurHomePage2(),
              SearchPage(),
              ProfilePage(),
            ],
            onPageChanged: (page) {
              setState(() {
                _selectedIndex = page;
              });
            }));
  }
}
