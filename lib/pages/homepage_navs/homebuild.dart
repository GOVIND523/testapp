import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeBuild extends StatelessWidget {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  const HomeBuild({super.key});

  @override
  Widget build(BuildContext context) {
    //obtaining screen dimensions
    _mediaQueryData = MediaQuery.of(context);
//screen height
    screenHeight = _mediaQueryData?.size.height;
//screen width
    screenWidth = _mediaQueryData?.size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight! / 20,
            ),
            SingleChildScrollView(
                child: Row(
              //section 1
              children: [
                Image.asset(
                  "lib/assets/images/hamburgermenu.png",
                  height: 40,
                  width: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset("lib/assets/images/dp.png"),
                const SizedBox(
                  width: 10,
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: const [
                //     Text(
                //       "Hello, Govind",
                //       style:
                //           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                //       textAlign: TextAlign.left,
                //     ),
                //     SizedBox(
                //       height: 4,
                //     ),
                //     Text(
                //       "Good morning",
                //       style: TextStyle(fontSize: 12),
                //       textAlign: TextAlign.left,
                //     )
                //   ],
                // ),
                Image.asset(
                  "lib/assets/images/bellicon.png",
                  height: 24,
                  width: 24,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
