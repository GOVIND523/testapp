import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/pages/registartion/register_rider.dart';

import 'login.dart';
//import 'package:flutter/rendering.dart';
//import 'package:testapp/pages/registartion/registration.dart';

class OwnerReg extends StatefulWidget {
  const OwnerReg({super.key});

  @override
  State<OwnerReg> createState() => _OwnerRegState();
}

class _OwnerRegState extends State<OwnerReg> {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  var name = '';
  var email = '';
  var password = '';
  var conpassword = '';
  var orgname = '';
  var orgadd = '';
  var number = '';
  var regnum = '';
  var model = '';
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmcontroller = TextEditingController();
  final TextEditingController _orgnamecontroller = TextEditingController();
  final TextEditingController _orgaddcontroller = TextEditingController();
  final TextEditingController _numbercontroller = TextEditingController();
  final TextEditingController _regnumbercontroller = TextEditingController();
  final TextEditingController _modelcontroller = TextEditingController();
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
                        "Owner Sign up",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Create a new account on Mate",
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
        child: Column(
          children: [
            TextField(
              controller: _namecontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  labelText: 'Name',
                  hintText: 'Enter Your Name'),
            ),
            SizedBox(height: 24),
            TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  labelText: 'E - mail',
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
            SizedBox(height: 24),
            TextField(
              controller: _confirmcontroller,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Your Password'),
            ),
            SizedBox(height: 24),
            TextField(
              controller: _orgnamecontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  labelText: 'Organisation Name',
                  hintText: 'Enter Your Organisation Name'),
            ),
            SizedBox(height: 24),
            TextField(
              controller: _orgaddcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  labelText: 'Organisation Address',
                  hintText: 'Enter Your Organisation Address'),
            ),
            SizedBox(height: 24),
            TextField(
              controller: _numbercontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  labelText: 'Contact Number',
                  hintText: 'Enter Your Contact Number'),
            ),
            SizedBox(
              height: 40,
            ),
            const Text(
              "Vehicle data",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            TextField(
              controller: _regnumbercontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  labelText: 'Registration Number',
                  hintText: 'Enter Your Registration Number'),
            ),
            SizedBox(height: 24),
            TextField(
              controller: _modelcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  labelText: 'Car Model',
                  hintText: 'Enter Your Car Model'),
            ),
            SizedBox(height: 24),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60),
                  backgroundColor: Colors.black),
              onPressed: () async {
                if (_namecontroller.text.length < 4) {
                  displayToastMessage(
                      "Name must be more than three characters", context);
                } else if (!_emailcontroller.text.contains("@")) {
                  displayToastMessage("Email is not valid", context);
                } else if (_numbercontroller.text.isEmpty) {
                  displayToastMessage("Enter a phone number", context);
                } else if (_orgaddcontroller.text.isEmpty) {
                  displayToastMessage("Enter organization address", context);
                } else if (_orgnamecontroller.text.isEmpty) {
                  displayToastMessage("Enter organization name", context);
                } else if (_passwordcontroller.text !=
                    _confirmcontroller.text) {
                  displayToastMessage("Password doesn't match", context);
                }
                registerNewUser(context);
              },
              child: const Text("Sign Up"),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      )
    ])));
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  registerNewUser(BuildContext context) async {
    final User? firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailcontroller.text,
                password: _passwordcontroller.text)
            .catchError((errMsg) {
      displayToastMessage(errMsg.toString(), context);
    }))
        .user;
    if (firebaseUser != null) {
      final User? user = _firebaseAuth.currentUser;
      final _uid = user!.uid;
      FirebaseFirestore.instance.collection('users').doc(_uid).set({
        'id': _uid,
        'name': _namecontroller.text,
        'email': _emailcontroller.text,
        'phonenumber': _numbercontroller.text,
        'org_name': _orgnamecontroller.text,
        'org_add': _orgaddcontroller.text,
        'vehicle_no': _regnumbercontroller.text,
        'vehicle_model': _modelcontroller.text
        //'createdAt':Timestamp.()
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginUser()));
    }
  }
}
