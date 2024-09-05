import 'package:flutter/material.dart';
import 'package:quest/pages/first.dart';
import 'package:quest/utils/my_button.dart';

class CreateAccountDiaglog extends StatelessWidget {
  const CreateAccountDiaglog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.green[200],
        content: Container(
            height: 500,
            width: 300,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Create Account",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w800)),
                  const SizedBox(
                    height: 40,
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Email Address",
                            contentPadding:
                                EdgeInsets.only(top: 10, left: 10))),
                  ),
                  const SizedBox(
                    height: 40,
                    child: TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Confirm Email Address",
                      contentPadding: EdgeInsets.only(top: 10, left: 10),
                    )),
                  ),
                  const SizedBox(
                    height: 40,
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Username",
                            contentPadding:
                                EdgeInsets.only(top: 10, left: 10))),
                  ),
                  const SizedBox(
                    height: 40,
                    child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Password",
                            contentPadding:
                                EdgeInsets.only(top: 10, left: 10))),
                  ),
                  const SizedBox(
                    height: 40,
                    child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Confirm Password",
                            contentPadding:
                                EdgeInsets.only(top: 10, left: 10))),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                            text: "Cancel",
                            onPressed: Navigator.of(context).pop),
                        MyButton(
                            text: "Yes",
                            onPressed: () {
                              Navigator.pushNamed(context, '/firstpage');
                            })
                      ])
                ])));
  }
}
