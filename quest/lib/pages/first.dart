// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:quest/pages/home.dart';
import 'package:quest/pages/profile.dart';
import 'package:quest/pages/search.dart';
import 'package:quest/utils/logoutDialog.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    //home page
    HomePage(),
    //search page
    SearchPage(),
    //profile page
    ProfilePage()
  ];

  void logout() {
    showDialog(
        context: context,
        builder: (context) {
          return LogoutDiaglog();
        });
  }

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
      ),
      drawer: Drawer(
          backgroundColor: Colors.purple[100],
          child: Column(children: [
            DrawerHeader(
                child: Text("QB",
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w600,
                    ))),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("S E T T I N G S"),
            ),
            ListTile(
              leading: Icon(Icons.door_back_door),
              title: Text("L O G O U T"),
              onTap: logout,
            )
          ])),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          items: [
            //home
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            //search
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            //profile
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
      body: _pages[_selectedIndex],
    );
  }
}
