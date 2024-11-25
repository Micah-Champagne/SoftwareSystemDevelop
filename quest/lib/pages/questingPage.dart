import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/models/currentQuests.dart';
import 'package:quest/utils/colors.dart';

class OurQuestingPage extends StatefulWidget {
  const OurQuestingPage(
      {super.key, required this.onPostQuest, required this.onCreateQuest});

  final VoidCallback onPostQuest;
  final VoidCallback onCreateQuest;

  @override
  State<OurQuestingPage> createState() => _OurQuestingPageState();
}

class _OurQuestingPageState extends State<OurQuestingPage> {


  List<bool> Completing = List.filled(10, false);
  int CompletingCount = 0;

  List<CurrentQuestModel> CurrentQuests = [];

  String _privacyOption = 'Public';

  // Function to handle option selection
  void _onPrivacyOptionSelected(String selected) {
    setState(() {
      _privacyOption = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ensure CurrentQuests is populated properly
    CurrentQuests = CurrentQuestModel.getCategories();
    return Scaffold(
      body: Column(
        children: [
          // Wrap the ListView.builder with Expanded to avoid overflow issues
          Expanded(
            child: ListView.builder(
              itemCount: CurrentQuests.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 150,
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: CurrentQuests[index].boxColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: .5, color: OurColors().darkGrey),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff1D1617).withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 2.0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Quest In-progress',
                              style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              CurrentQuests[index].time,
                              style: GoogleFonts.lato(
                                  fontSize: 14, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 0.3,
                        width: 375,
                        decoration: BoxDecoration(
                          color: OurColors().darkGrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 300,
                            child: Text(
                              CurrentQuests[index].quest,
                              softWrap: true,
                              style: GoogleFonts.lato(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (Completing[index] == true) {
                                    Completing[index] = false;
                                    CompletingCount--;
                                  } else if (Completing[index] == false) {
                                    Completing[index] = true;
                                    CompletingCount++;
                                  }
                                });
                              },
                              child: Container(
                                  child: Completing[index]
                                      ? SvgPicture.asset(
                                          "assets/icons/checkcircle.svg")
                                      : SvgPicture.asset(
                                          "assets/icons/emptycircle.svg")))
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(height: 1, color: OurColors().darkGrey),
          CompletingCount > 0
              ? Container(
                  color: OurColors().lightPurple,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Icon(_privacyOption == 'Public'
                                ? Icons.public
                                : Icons.lock),
                            const SizedBox(width: 5),
                            SizedBox(
                              width: 60,
                              child: Text(
                                _privacyOption,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            PopupMenuButton<String>(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: _privacyOption == 'Public'
                                    ? Colors.purple
                                    : Colors.black,
                              ),
                              onSelected: _onPrivacyOptionSelected,
                              itemBuilder: (BuildContext context) {
                                return [
                                  PopupMenuItem<String>(
                                    value: 'Public',
                                    child: Text(
                                      'Public',
                                      style: GoogleFonts.lato(
                                        color: _privacyOption == 'Public'
                                            ? Colors.purple
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'Private',
                                    child: Text(
                                      'Private',
                                      style: GoogleFonts.lato(
                                        color: _privacyOption == 'Private'
                                            ? Colors.purple
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ];
                              },
                              offset: const Offset(-75, -110),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                widget.onPostQuest();
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                ),
                                child: Center(
                                  child: Text(
                                    "Post",
                                    style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            SvgPicture.asset('assets/icons/checkcircle.svg'),
                            
                            const SizedBox(width: 20),
                          ],
                        ),
                      ]),
                )
              : Container(
                  height: 50,
                  color: OurColors().cremeColor,
                  child: GestureDetector(
                    onTap: () {
                      widget.onCreateQuest();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.black),
                            ),
                            child: const Icon(Icons.add)),
                        const SizedBox(width: 10),
                        Text("Add New Quest",
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}
