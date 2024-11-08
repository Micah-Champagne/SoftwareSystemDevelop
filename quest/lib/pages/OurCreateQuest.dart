import 'package:flutter/material.dart';

class OurCreateQuest extends StatefulWidget {
  const OurCreateQuest({super.key});

  @override
  State<OurCreateQuest> createState() => _OurCreateQuestState();
}

final Color _OurLightPurple = const Color(0x99838ef4);
final Color _OurDarkGrey = const Color(0xff262626);
final Color _OurPurpleBackground = const Color(0xff838ef4);
final Color _OurCremeColor = const Color(0xfffefdf5);
List<bool> whichSelected = List.filled(4, false);

class _OurCreateQuestState extends State<OurCreateQuest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 232, 219, 240),
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Quest Title',
                hintStyle:
                    const TextStyle(color: Color(0x66262626), fontSize: 18),
                suffixIcon: SizedBox(
                  width: 100,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: _OurDarkGrey))),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(height: 75, width: 175, color: Colors.green),
            Container(height: 75, width: 175, color: Colors.blue)
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(height: 75, width: 175, color: Colors.yellow),
            Container(height: 75, width: 175, color: Colors.red)
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
          child: TextField(
            maxLines: 10,
            decoration: InputDecoration(
              
                filled: true,
                fillColor: Color.fromARGB(255, 232, 219, 240),
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Quest Description',
                hintStyle:
                    const TextStyle(color: Color(0x66262626), fontSize: 18),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: _OurDarkGrey))),
          ),
        ),
        Container(
            height: 75,
            width: 300,
            color: Colors.purple,
            child: Text("Begin Quest"))
      ],
    );
  }
}
