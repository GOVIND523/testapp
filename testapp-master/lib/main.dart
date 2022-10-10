import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/pages/homepage.dart';
import 'package:testapp/pages/walkthrough.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: showHome ? const HomePage() : const Walkthrough(),
      debugShowCheckedModeBanner: false,
    );
  }
}


//progress::
  //splashscreen - manually using timer method
  //walkthrough