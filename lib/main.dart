//import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/pages/homepage.dart';
import 'package:testapp/pages/homepage_navs/homebuild.dart';
import 'package:testapp/pages/registartion/login.dart';
import 'package:testapp/pages/registartion/register_owner.dart';
import 'package:testapp/pages/registartion/register_rider.dart';
//import 'package:testapp/pages/registartion/register_owner.dart';
//import 'package:testapp/pages/homepage.dart';
//import 'package:testapp/pages/registartion/registration.dart';
//import 'package:testapp/pages/walkthrough.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testapp/pages/walkthrough.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    
    MaterialApp(
      //home: HomeBuild(),
      home: showHome ? const HomePage() : const Walkthrough(),
      debugShowCheckedModeBanner: false,
    );
  }
}


//progress::
  //splashscreen - manually using timer method
  //walkthrough