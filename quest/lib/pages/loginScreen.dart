import 'package:flutter/material.dart';
import 'package:quest/utils/createAccountDialog.dart';
import 'package:quest/utils/my_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

void CreateAccount(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return CreateAccountDiaglog();
      });
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 100),
          Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset: Offset(2.0, 2.0))
                  ]),
              child: const Center(
                child: Text("Quest\nBuddy",
                    style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Please enter your credentials.",
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Username",
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                  text: "Create Account",
                  onPressed: () => CreateAccount(context)),
              const SizedBox(width: 40),
              MyButton(
                  text: "Sign In",
                  onPressed: () {
                    Navigator.pushNamed(context, '/firstpage');
                  })
            ],
          )
        ]));
  }
}
