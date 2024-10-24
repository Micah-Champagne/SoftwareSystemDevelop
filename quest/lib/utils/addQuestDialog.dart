import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quest/utils/my_button.dart';

class Addquestdialog extends StatefulWidget {
  const Addquestdialog({super.key});

  @override
  State<Addquestdialog> createState() => _AddquestdialogState();
}

class _AddquestdialogState extends State<Addquestdialog> {
  var _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: SizedBox(
            height: 500,
            width: 300,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Add a new Quest",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                  const SizedBox(
                    height: 40,
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Quest Category",
                            contentPadding:
                                EdgeInsets.only(top: 10, left: 10))),
                  ),
                  const SizedBox(
                    height: 40,
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "New Quest",
                            contentPadding:
                                EdgeInsets.only(top: 10, left: 10))),
                  ),
                  const Text("Effort Level"),
                  CupertinoSegmentedControl<int>(
                              children: const {
                                0: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Easy Peasy"),
                                ),
                                1: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Marginal Effort"),
                                ),
                                2: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Hard as Fucccc"),
                                ),
                              },
                              groupValue: _selectedSegment,
                              onValueChanged: (int? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    _selectedSegment = newValue;
                                  });
                                }
                              },
                            ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                            text: "Cancel",
                            onPressed: Navigator.of(context).pop),
                        MyButton(
                            text: "Save", onPressed: Navigator.of(context).pop)
                      ])
                ])));
  }
}
