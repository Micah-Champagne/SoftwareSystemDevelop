// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Color _OurDarkGrey = const Color(0xff262626);
Color _OurPurpleBackground = const Color(0xff838ef4);
Color _OurCremeColor = const Color(0xfffefdf5);

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  final _SignInController = OverlayPortalController();
  final _RegisterController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _OurPurpleBackground,
        body: ListView(children: [
          const SizedBox(height: 250),
          SvgPicture.asset("assets/icons/qbLandingLogo.svg",
              height: 250, width: 250),
          const SizedBox(height: 150),
          Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: SizedBox(
                width: 150,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: _OurDarkGrey,
                      foregroundColor: Colors.white),
                  onPressed: _SignInController.toggle,
                  child: OverlayPortal(
                    controller: _SignInController,
                    overlayChildBuilder: (BuildContext context) {
                      return Positioned(
                          left: 25,
                          bottom: 20,
                          right: 25,
                          child: Container(
                              height: 400,
                              width: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: _OurCremeColor,
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: IconButton(onPressed: _SignInController.toggle, icon: const Icon(Icons.arrow_back, color: Colors.black))
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 25.0),
                                      child: Text(
                                        "Username",
                                        style: TextStyle(
                                            color: _OurDarkGrey, fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 5, left: 20, right: 20),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: _OurCremeColor,
                                            contentPadding: const EdgeInsets.all(15),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: _OurDarkGrey,
                                                    width: 1.0), borderRadius: BorderRadius.circular(10))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 25.0, top: 10),
                                      child: Text(
                                        "Password",
                                        style: TextStyle(
                                            color: _OurDarkGrey, fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 5, left: 20, right: 20),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: _OurCremeColor,
                                          contentPadding: const EdgeInsets.all(15),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: _OurDarkGrey,
                                                  width: 1.0), borderRadius: BorderRadius.circular(10)),
                                        ),
                                        obscureText: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, top: 30),
                                      child: Container(
                                          height: 50,
                                          width: 350,
                                          color: Colors.black,
                                          child: Center(
                                            child: Text("Sign In", style: TextStyle(color: _OurCremeColor, fontSize: 18)))),
                                    ),
                                    const SizedBox(height: 30),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25.0),
                                      child: Text("Forgot Password?", style: TextStyle(fontSize: 18, decoration:  TextDecoration.underline, color: _OurDarkGrey)),
                                    )
                                  ])));
                    },
                    child: const Text("LOGIN"),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
            child: SizedBox(
                width: 150,
                height: 60,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: _OurPurpleBackground,
                        foregroundColor: Colors.white,
                        side: BorderSide(width: 2, color: _OurDarkGrey)),
                    onPressed: _RegisterController.toggle,
                    child: OverlayPortal(
                    controller: _RegisterController,
                    overlayChildBuilder: (BuildContext context) {
                      return Positioned(
                          left: 25,
                          bottom: 20,
                          right: 25,
                          child: Container(
                              height: 400,
                              width: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: _OurCremeColor,
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: IconButton(onPressed: _RegisterController.toggle, icon: const Icon(Icons.arrow_back, color: Colors.black))
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 25.0),
                                      child: Text(
                                        "Username",
                                        style: TextStyle(
                                            color: _OurDarkGrey, fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 5, left: 20, right: 20),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: _OurCremeColor,
                                            contentPadding: const EdgeInsets.all(15),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: _OurDarkGrey,
                                                    width: 1.0), borderRadius: BorderRadius.circular(10))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 25.0, top: 10),
                                      child: Text(
                                        "Password",
                                        style: TextStyle(
                                            color: _OurDarkGrey, fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 5, left: 20, right: 20),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: _OurCremeColor,
                                          contentPadding: const EdgeInsets.all(15),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: _OurDarkGrey,
                                                  width: 1.0), borderRadius: BorderRadius.circular(10)),
                                        ),
                                        obscureText: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, top: 30),
                                      child: Container(
                                          height: 50,
                                          width: 350,
                                          color: Colors.black,
                                          child: Center(
                                            child: Text("Sign In", style: TextStyle(color: _OurCremeColor, fontSize: 18)))),
                                    ),
                                    const SizedBox(height: 30),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25.0),
                                      child: Text("Forgot Password?", style: TextStyle(fontSize: 18, decoration:  TextDecoration.underline, color: _OurDarkGrey)),
                                    )
                                  ])));
                    },
                    child: const Text("CREATE ACCOUNT"),
                  ),)),
          )
        ]));
  }
}
