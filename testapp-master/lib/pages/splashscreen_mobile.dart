import 'package:flutter/material.dart';

class SplashScreenMob extends StatelessWidget {
  const SplashScreenMob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.zero),
            //map image bg image
            image: DecorationImage(
                image: AssetImage("lib/assets/images/map_img.png"),
                fit: BoxFit.fitHeight)),
        //hero image scotter wala
        child: const Image(
          image: AssetImage("lib/assets/images/splashscreen_img_png.png"),
          alignment: Alignment.center,
          fit: BoxFit.fitHeight,
        ));
  }
}
