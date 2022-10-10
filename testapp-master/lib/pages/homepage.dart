import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testapp/pages/splashscreen_mobile.dart';

//stateful widget homepage
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  SplashScreenState createState() => SplashScreenState();
}

//splash screen state
class SplashScreenState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
//timer fuction has two arguments one the duration of the state and the action to be performed after the duration
//setting timer to standard time i.e 3 seconds
    Timer(
        const Duration(seconds: 10),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

//splash screen widget
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenMob(),
    );

    // return Container(
    //   constraints: const BoxConstraints.expand(),
    //   decoration: const BoxDecoration(
    //       image: DecorationImage(
    //           image: AssetImage("lib/assets/1.jpg"), fit: BoxFit.fitHeight)),
    // );
  }
}

//homescreen widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello")),
    );
  }
}
