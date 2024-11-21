// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quest/models/newBuddy_list.dart';

class OurAddBuddy extends StatefulWidget {
  const OurAddBuddy({super.key});

  @override
  State<OurAddBuddy> createState() => _OurAddBuddyState();
}

class _OurAddBuddyState extends State<OurAddBuddy> {
  final Color _OurLightPurple = const Color(0x99838ef4);

  final Color _OurDarkGrey = const Color(0xff262626);

  final Color _OurPurpleBackground = const Color(0xff838ef4);

  final Color _OurCremeColor = const Color(0xfffefdf5);

  final Color _OurSelectedTab = const Color(0xffb5baf4);

  final Color _OurNotSelectedTab = const Color(0xffa78fb8);

  List<AddBuddyListModel> AddBuddies = [];
  List<bool> added = List.filled(8, false);
  @override
  Widget build(BuildContext context) {
    AddBuddies = AddBuddyListModel.getCategories();
    return Scaffold(
        body: ListView.builder(
            itemCount: AddBuddies.length + 1,
            itemBuilder: (context, index) {
              // Subsequent containers with identical style
              if (index == 0) {
                return Container(
                    margin: EdgeInsets.only(
                        left: 25, top: 25, right: 25, bottom: 15),
                    //padding: EdgeInsets.all(5),

                    decoration: BoxDecoration(
                      //color: Color(0xffECE6F0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 232, 219, 240),
                          contentPadding: const EdgeInsets.all(15),
                          hintText: 'Search by Username',
                          hintStyle: const TextStyle(
                              color: Color(0x66262626), fontSize: 14),
                          suffixIcon: SizedBox(
                            width: 100,
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const VerticalDivider(
                                    color: Colors.black,
                                    indent: 10,
                                    endIndent: 10,
                                    thickness: 0.1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.search,
                                        color: Color(0x66262626)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none)),
                    ));
              } else {
                return Container(
                    height: 70,
                    margin: EdgeInsets.only(left: 24, right: 24),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: ClipOval(
                                child: Image.asset(AddBuddies[index - 1].image,
                                    height: 50, width: 50, fit: BoxFit.cover)),
                          ),
                          Container(
                              height: 50,
                              width: 225,
                              decoration: BoxDecoration(
                                  color: _OurLightPurple,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AddBuddies[index - 1].name,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: _OurLightPurple,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // Ensure state is updated and the widget rebuilds
                                setState(() {
                                  if (added[index - 1] == false) {
                                    added[index - 1] =
                                        true; // Set it to true if it was false
                                  } else {
                                    added[index - 1] =
                                        false; // Set it to false if it was true
                                  }
                                });
                              },
                              child: SizedBox(
                                height: 35,
                                width: 35,
                                child: added[index - 1] == true
                                    ? Icon(Icons.check)
                                    : Icon(Icons.add),
                              ),
                            ),
                          )
                        ]));
              }
            }));
  }
}
