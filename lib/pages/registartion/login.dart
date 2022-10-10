import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testapp/pages/registartion/registration.dart';

import '../homepage.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class _LoginUserState extends State<LoginUser> {
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  static MediaQueryData? _mediaQueryData;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static double? screenWidth;
  static double? screenHeight;
  @override
  Widget build(BuildContext context) {
    //obtaining screen dimensions
    _mediaQueryData = MediaQuery.of(context);
//screen height
    screenHeight = _mediaQueryData?.size.height;
//screen width
    screenWidth = _mediaQueryData?.size.width;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Login with your credentials",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenWidth! / 30,
                  ),
                  SizedBox(
                    height: 120,
                    child: Image(
                      image: AssetImage("lib/assets/images/owner.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth! / 20),
        //padding: const EdgeInsets.symmetric(vertical: ),
        child: Column(children: [
          TextField(
            controller: _emailcontroller,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                labelText: 'E-mail',
                hintText: 'Enter Your E-mail'),
          ),
          SizedBox(height: 24),
          TextField(
            controller: _passwordcontroller,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                labelText: 'Password',
                hintText: 'Enter Your Password'),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60),
                backgroundColor: Colors.black),
            onPressed: () async {
              try {
                final user = await _firebaseAuth.signInWithEmailAndPassword(
                    email: _emailcontroller.text,
                    password: _passwordcontroller.text);
                if (user != null) {}
              } catch (e) {
                print(e);
              }

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: const Text("Sign Up"),
          ),
        ]),
      )
    ])));
  }
}
