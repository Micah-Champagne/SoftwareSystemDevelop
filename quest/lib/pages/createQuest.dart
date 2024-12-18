import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/utils/colors.dart';

class CreateQuest extends StatefulWidget {
  const CreateQuest({super.key, required this.BeginQuest});
  final VoidCallback BeginQuest;

  @override
  State<CreateQuest> createState() => _CreateQuestState();
}

List<bool> whichSelected = List.filled(4, false);

class _CreateQuestState extends State<CreateQuest> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          QuestTitleBar(),
          QuestTypeSelectorTop(),
          const SizedBox(height: 10),
          QuestTypeSelectorBottom(),
          QuestDescriptionBox(),
          BeginQuestButton(),
          const SizedBox(height: 10)
        ],
      ),
    );
  }

  GestureDetector BeginQuestButton() {
    return GestureDetector(
      onTap: () {
        widget.BeginQuest();
      },
      child: Container(
          height: 75,
          width: 300,
          decoration: BoxDecoration(
              color: OurColors().lightPurple,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            "Begin Quest",
            style: GoogleFonts.lato(fontSize: 28, color: Colors.black),
          ))),
    );
  }

  Container QuestDescriptionBox() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
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
                borderSide: BorderSide(color: OurColors().darkGrey))),
      ),
    );
  }

  Row QuestTypeSelectorBottom() {
    return Row(
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
                  color: OurColors().chores,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 10),
                  Icon(Icons.house_sharp, color: OurColors().darkGrey, size: 40),
                  const SizedBox(width: 5),
                  Text("Household",
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  
                ],
              )),
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
                  color: OurColors().physical,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 10),
                  Icon(Icons.fitness_center, color: OurColors().darkGrey, size: 35),
                  const SizedBox(width: 15),
                  Text("Physical",
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ],
              )),
        )
      ],
    );
  }

  Row QuestTypeSelectorTop() {
    return Row(
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
                  color: OurColors().professional,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 10),
                  Icon(Icons.workspace_premium, color: OurColors().darkGrey, size: 40),
                  Text("Professional",
                      style: GoogleFonts.lato(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
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
                  color: OurColors().education,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 10),
                  Icon(Icons.school, color: OurColors().darkGrey, size: 40),
                  const SizedBox(width: 5),
                  Text("Educational",
                      style: GoogleFonts.lato(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)), 
                ],
              )),
        )
      ],
    );
  }

  Container QuestTitleBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
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
                borderSide: BorderSide(color: OurColors().darkGrey))),
      ),
    );
  }
}
