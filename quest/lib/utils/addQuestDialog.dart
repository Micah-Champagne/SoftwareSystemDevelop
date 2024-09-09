import 'package:flutter/material.dart';
import 'package:quest/utils/my_button.dart';

class Addquestdialog extends StatelessWidget {
  const Addquestdialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.orange[200],
        content: SizedBox(
            height: 120,
            width: 300,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Add a new Quest",
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
