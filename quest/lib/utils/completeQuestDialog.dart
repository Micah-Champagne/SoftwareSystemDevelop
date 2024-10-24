import 'package:flutter/material.dart';
import 'package:quest/utils/my_button.dart';

class Completequestdialog extends StatefulWidget {
  const Completequestdialog({super.key});

  @override
  State<Completequestdialog> createState() => _CompletequestdialogState();
}

final List<String> questLog = ["Quest 1", "Quest 2", "Quest 3"];

class _CompletequestdialogState extends State<Completequestdialog> {
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
                  const Text("Select a Quest to complete",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                  
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                            text: "No", onPressed: Navigator.of(context).pop),
                        MyButton(
                            text: "Yes", onPressed: Navigator.of(context).pop)
                      ])
                ])));
  }
}
