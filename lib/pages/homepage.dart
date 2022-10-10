import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:testapp/pages/splashscreen_mobile.dart';
import 'homepage_navs/homebuild.dart';

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
        const Duration(seconds: 3),
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

    // return Container(yt
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
  static MediaQueryData? _mediaQueryData;
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
        bottomNavigationBar: Container(
      color: Colors.black,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 16, vertical: screenHeight! / 30),
        child: GNav(
            gap: 8,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            padding: EdgeInsets.all(8),
            tabBackgroundColor: Color.fromARGB(255, 36, 36, 36),
            tabs: [
              GButton(
                icon: Icons.home_filled,
                text: 'Home',
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeBuild()));
                },
              ),
              GButton(
                icon: Icons.location_city_rounded,
                text: 'Journey',
                onPressed: () {},
              ),
              GButton(icon: Icons.chat, text: 'Social'),
              GButton(
                icon: Icons.payment,
                text: 'Payments',
              ),
            ]),
      ),
    ));
  }
}
