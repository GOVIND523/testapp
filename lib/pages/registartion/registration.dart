import 'package:flutter/material.dart';
import 'package:testapp/pages/registartion/register_owner.dart';
import 'package:testapp/pages/registartion/register_rider.dart';
import 'package:testapp/pages/splashscreen_mobile.dart';

class RegistrationRole extends StatelessWidget {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  const RegistrationRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //obtaining screen dimensions
    _mediaQueryData = MediaQuery.of(context);
//screen height
    screenHeight = _mediaQueryData?.size.height;
//screen width
    screenWidth = _mediaQueryData?.size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Choose your role :",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const RiderReg())),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                          height: screenHeight! / 3,
                          width: screenWidth! / 3,
                          child: const Image(
                            image: AssetImage("lib/assets/images/rider.png"),
                            fit: BoxFit.fitHeight,
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Mate",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "If You Are A Rider",
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const OwnerReg())),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                          height: screenHeight! / 3,
                          width: screenWidth! / 3,
                          child: const Image(
                            image: AssetImage("lib/assets/images/owner.png"),
                            fit: BoxFit.contain,
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Owner",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "If You Own A Vehicle",
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
