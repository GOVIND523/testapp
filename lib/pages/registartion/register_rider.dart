import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testapp/pages/registartion/login.dart';

class RiderReg extends StatefulWidget {
  const RiderReg({super.key});

  @override
  State<RiderReg> createState() => _RiderRegState();
}

class _RiderRegState extends State<RiderReg> {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmcontroller = TextEditingController();
  final TextEditingController _orgnamecontroller = TextEditingController();
  final TextEditingController _orgaddcontroller = TextEditingController();
  final TextEditingController _numbercontroller = TextEditingController();
  var name = '';
  var email = '';
  var password = '';
  var conpassword = '';
  var orgname = '';
  var orgadd = '';
  var number = '';

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
                    children: const [
                      Text(
                        "Rider Sign up",
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
                    width: screenWidth! / 7,
                  ),
                  SizedBox(
                    height: 120,
                    child: Image(
                      image: AssetImage("lib/assets/images/rider.png"),
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
        margin: EdgeInsets.symmetric(horizontal: screenWidth! / 10),
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
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  labelText: 'Contact Number',
                  hintText: 'Enter Your Contact Number'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60),
                  backgroundColor: Colors.black),
              onPressed: () async {
                // name = _namecontroller.text;
                // email = _emailcontroller.text;
                // password = _passwordcontroller.text;
                // conpassword = _confirmcontroller.text;
                // orgadd = _orgaddcontroller.text;
                // orgname = _orgnamecontroller.text;
                // number = _numbercontroller.text;
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
                // else if (_passwordcontroller.text.length > 6) {
                //   displayToastMessage(
                //       "Password must be greater than 6 characters", context);
                // }

                registerNewUser(context);
              },
              child: const Text("Sign Up"),
            ),
            SizedBox(
              height: 100,
            )
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
        //'createdAt':Timestamp.()
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginUser()));
    }
    //save info
    // Map userdataMap = {
    //   "name": _namecontroller.text.trim(),
    //   "email": _emailcontroller.text.trim(),
    //   "number": _numbercontroller.text.trim(),
    //   "org_name": _orgnamecontroller.text.trim(),
    //   "org_add": _orgaddcontroller.text.trim()
    // };
    // DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users");
    // userRef.child(firebaseUser!.uid).set(userdataMap);

    // // FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).set({
    // //   "name": _namecontroller.text,
    // //   "email": _emailcontroller.text,
    // //   "number": _numbercontroller.text,
    // //   "org_name": _orgnamecontroller.text,
    // //   "org_add": _orgaddcontroller.text
    // // });
    // //Fluttertoast.showToast(msg: "User Account is created successfully");
    // displayToastMessage("Your account has been created", context);
    // // } else {
    // // error
    // // displayToastMessage("User has not been created !", context);
    // // Fluttertoast.showToast(msg: "User Account is not created ");
    // // }
  }
}

displayToastMessage(message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
