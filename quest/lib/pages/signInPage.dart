// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quest/utils/colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  final _SignInController = OverlayPortalController();
  final _RegisterController = OverlayPortalController();
  bool signInEnabled = false;
  bool registerEnabled = false;
  bool _obsureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: OurColors().purpleBackground,
        body: ListView(children: [
          const SizedBox(height: 150),
          SvgPicture.asset("assets/icons/qbLandingLogo.svg",
              height: 200, width: 200),
          Image.asset(
            "assets/icons/name.jpeg",
            height: 80,
          ),
          const SizedBox(height: 175),
          LoginButtonAndOverlay(),
          CreateAccountButtonAndOverlay()
        ]));
  }

  Padding LoginButtonAndOverlay() {
    return Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: SizedBox(
          width: 150,
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: OurColors().darkGrey,
                foregroundColor: Colors.white),
            onPressed: () {
              if (registerEnabled) {
                _RegisterController.toggle();
                registerEnabled = false;
              }
              if (!signInEnabled) {
                _SignInController.toggle();
                signInEnabled = true;
                registerEnabled = false;
              }
            },
            child: OverlayPortal(
              controller: _SignInController,
              overlayChildBuilder: (BuildContext context) {
                return Positioned(
                    left: 25,
                    top: 45,
                    right: 25,
                    child: Container(
                        height: 350,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: OurColors().cremeColor,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: IconButton(
                                      onPressed: () {
                                        if (signInEnabled) {
                                          _SignInController.toggle();
                                          signInEnabled = false;
                                        }
                                        if (registerEnabled) {
                                          _RegisterController.toggle();
                                          registerEnabled = false;
                                        }
                                      },
                                      icon: const Icon(Icons.arrow_back,
                                          color: Colors.black))),
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                margin: const EdgeInsets.only(
                                    top: 5, left: 20, right: 20),
                                child: _OurPlainTextField("Username"),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                margin: const EdgeInsets.only(
                                    top: 5, left: 20, right: 20),
                                child: _OurSecretTextField("Password"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 30),
                                child: SizedBox(
                                    height: 50,
                                    width: 350,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            backgroundColor:
                                                OurColors().darkGrey,
                                            foregroundColor: Colors.white),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/ourappnav');
                                        },
                                        child: const Text("SIGN IN"))),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Text("Forgot Password?",
                                    style: TextStyle(
                                        fontSize: 18,
                                        decoration: TextDecoration.underline,
                                        color: OurColors().darkGrey)),
                              )
                            ])));
              },
              child: const Text("LOGIN"),
            ),
          ),
        ));
  }

  Padding CreateAccountButtonAndOverlay() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
      child: SizedBox(
          width: 150,
          height: 60,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: OurColors().purpleBackground,
                foregroundColor: Colors.white,
                side: BorderSide(width: 2, color: OurColors().darkGrey)),
            onPressed: () {
              if (!registerEnabled) {
                _RegisterController.toggle();
                registerEnabled = true;
              }
              if (signInEnabled) {
                _SignInController.toggle();
                signInEnabled = false;
              }
            },
            child: OverlayPortal(
              controller: _RegisterController,
              overlayChildBuilder: (BuildContext context) {
                return Positioned(
                    left: 25,
                    top: 45,
                    right: 25,
                    child: Container(
                        height: 500,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: OurColors().cremeColor,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: IconButton(
                                      onPressed: () {
                                        if (registerEnabled) {
                                          _RegisterController.toggle();
                                          registerEnabled = false;
                                        }
                                        if (signInEnabled) {
                                          _SignInController.toggle();
                                          signInEnabled = false;
                                        }
                                      },
                                      icon: const Icon(Icons.arrow_back,
                                          color: Colors.black))),
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                margin: const EdgeInsets.only(
                                    top: 5, left: 20, right: 20),
                                child: _OurPlainTextField("Email"),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                margin: const EdgeInsets.only(
                                    top: 5, left: 20, right: 20),
                                child:
                                    _OurPlainTextField("Choose Your Username"),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                margin: const EdgeInsets.only(
                                    top: 5, left: 20, right: 20),
                                child: _OurSecretTextField("Password"),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                margin: const EdgeInsets.only(
                                    top: 5, left: 20, right: 20),
                                child: _OurSecretTextField("Confirm Password"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 30),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/ourappnav');
                                  },
                                  child: SizedBox(
                                      height: 50,
                                      width: 350,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              backgroundColor:
                                                  OurColors().darkGrey,
                                              foregroundColor: Colors.white),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/ourappnav');
                                          },
                                          child: const Text("REGISTER"))),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Row(
                                  children: [
                                    Text("Already have an account?",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: OurColors().darkGrey)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (registerEnabled) {
                                            _RegisterController.toggle();
                                            registerEnabled = false;
                                          }
                                          if (!signInEnabled) {
                                            _SignInController.toggle();
                                            signInEnabled = true;
                                          }
                                        },
                                        child: Text("Login",
                                            style: TextStyle(
                                                fontSize: 18,
                                                decoration:
                                                    TextDecoration.underline,
                                                color: OurColors().darkGrey)),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ])));
              },
              child: const Text("CREATE ACCOUNT"),
            ),
          )),
    );
  }

  TextField _OurPlainTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: OurColors().cremeColor,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: OurColors().darkGrey, width: 1.0),
              borderRadius: BorderRadius.circular(10))),
    );
  }

  TextField _OurSecretTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obsureText = !_obsureText;
              });
            },
            icon: Icon(_obsureText ? Icons.visibility_off : Icons.visibility)),
        filled: true,
        fillColor: OurColors().cremeColor,
        hintText: hintText,
        contentPadding: const EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: OurColors().darkGrey, width: 1.0),
            borderRadius: BorderRadius.circular(10)),
      ),
      obscureText: _obsureText,
    );
  }
}
