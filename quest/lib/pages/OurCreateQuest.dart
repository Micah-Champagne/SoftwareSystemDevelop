import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OurCreateQuest extends StatefulWidget {
  const OurCreateQuest({super.key, required this.BeginQuest});
  final VoidCallback BeginQuest;

  @override
  State<OurCreateQuest> createState() => _OurCreateQuestState();
}

const Color _OurLightPurple = Color(0x99838ef4);
const Color _OurDarkGrey = Color(0xff262626);
const Color _OurPurpleBackground = Color(0xff838ef4);
const Color _OurCremeColor = Color(0xfffefdf5);
Color education = const Color(0xffA8D8EA);
Color physical = const Color(0xffF4C3A5);
Color professional = const Color(0xffB7E9A0);
Color chores = const Color(0xffF6E89D);

List<bool> whichSelected = List.filled(4, false);

class _OurCreateQuestState extends State<OurCreateQuest> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
            child: TextField(
              style: GoogleFonts.lato(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 232, 219, 240),
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'Quest Title',
                  hintStyle:
                      GoogleFonts.lato(color: const Color(0x66262626), fontSize: 18),
                  suffixIcon: const SizedBox(
                    width: 100,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: _OurDarkGrey))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (!whichSelected[0]) {
                      whichSelected = List.filled(4, false);
                      whichSelected[0] = true;
                    } else {
                      whichSelected = List.filled(4, false);
                    }
                  });
                },
                child: Container(
                    height: 75,
                    width: 150,
                    decoration: BoxDecoration(
                        border: whichSelected[0] ? Border.all() : null,
                        color: professional,
                        borderRadius: BorderRadius.circular(10)),
                    child:  Center(
                      child: Text("Professional", style: GoogleFonts.lato(color: Colors.black)),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (!whichSelected[1]) {
                      whichSelected = List.filled(4, false);
                      whichSelected[1] = true;
                    } else {
                      whichSelected = List.filled(4, false);
                    }
                  });
                },
                child: Container(
                    height: 75,
                    width: 150,
                    decoration: BoxDecoration(
                        border: whichSelected[1] ? Border.all() : null,
                        color: education,
                        borderRadius: BorderRadius.circular(10)),
                    child:  Center(child: Text("Educational",style: GoogleFonts.lato(color: Colors.black)))),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (!whichSelected[2]) {
                      whichSelected = List.filled(4, false);
                      whichSelected[2] = true;
                    } else {
                      whichSelected = List.filled(4, false);
                    }
                  });
                },
                child: Container(
                    height: 75,
                    width: 150,
                    decoration: BoxDecoration(
                        border: whichSelected[2] ? Border.all() : null,
                        color: chores,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text("Household",style: GoogleFonts.lato(color: Colors.black)))),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (!whichSelected[3]) {
                      whichSelected = List.filled(4, false);
                      whichSelected[3] = true;
                    } else {
                      whichSelected = List.filled(4, false);
                    }
                  });
                },
                child: Container(
                    height: 75,
                    width: 150,
                    decoration: BoxDecoration(
                        border: whichSelected[3] ? Border.all() : null,
                        color: physical,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text("Physical",style: GoogleFonts.lato(color: Colors.black)))),
              )
            ],
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
            child: TextField(
              textInputAction: TextInputAction.done,
              maxLines: 7,
              style: GoogleFonts.lato(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 232, 219, 240),
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'Quest Description',
                  hintStyle:
                      GoogleFonts.lato(color: const Color(0x66262626), fontSize: 18),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: _OurDarkGrey))),
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.BeginQuest();
            },
            child: Container(
                height: 75,
                width: 300,
                decoration: BoxDecoration(
                    color: _OurLightPurple,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "Begin Quest",
                  style: GoogleFonts.lato(fontSize: 28, color: Colors.black),
                ))),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
