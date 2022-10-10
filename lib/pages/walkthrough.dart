import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:testapp/pages/registartion/registration.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({Key? key}) : super(key: key);

  @override
  WalkthroughState createState() => WalkthroughState();
}

class WalkthroughState extends State<Walkthrough> {
//variables
  final controller = PageController();
  bool isLastPage = false;
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

//controller dispose method
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//obtaining screen dimensions
    _mediaQueryData = MediaQuery.of(context);
//screen height
    screenHeight = _mediaQueryData?.size.height;
//screen width
    screenWidth = _mediaQueryData?.size.width;

    return Scaffold(
//pageview
      body: PageView(controller: controller, children: [
//page 1 walkthorugh
        Container(
          decoration: const BoxDecoration(
              //bg image
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage("lib/assets/images/Walkthrgh_bg.png"),
                  fit: BoxFit.fitHeight)),
          child: Column(
            children: [
              //dog image
              Container(
                height: screenHeight! / 3,
                width: screenWidth,
                margin: const EdgeInsets.fromLTRB(24, 64, 24, 24),
                decoration: const BoxDecoration(
                    //color: Colors.white,
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage("lib/assets/images/ss1.png"),
                        fit: BoxFit.fitHeight)),
              ),
              //card of content
              Container(
                height: screenHeight! / 3,
                width: screenWidth,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  //shadow box
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(16, 9, 9, 9),
                      blurRadius: 12.0,
                      spreadRadius: 0.5,
                      offset: Offset(3.0, 4.0),
                    )
                  ],
                ),
                //contents
                child: Column(children: [
                  const Text(
                    "Group creation",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      //fontFamily: "Visby"
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Create your own community of nearby people to let your daily journey be convenient",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextButton(
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut)),
                ]),
              ),
            ],
          ),
        ),
//page 2 walkthorugh
        Container(
          decoration: const BoxDecoration(
              //bg image
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage("lib/assets/images/Walkthrgh_bg.png"),
                  fit: BoxFit.fitHeight)),
          child: Column(
            children: [
              //dog image
              Container(
                height: screenHeight! / 3,
                width: screenWidth,
                margin: const EdgeInsets.fromLTRB(24, 64, 24, 24),
                decoration: const BoxDecoration(
                    //color: Colors.white,
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage("lib/assets/images/ss2.png"),
                        fit: BoxFit.fitHeight)),
              ),
              //card of content
              Container(
                height: screenHeight! / 3,
                width: screenWidth,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  //shadow box
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(16, 9, 9, 9),
                      blurRadius: 12.0,
                      spreadRadius: 0.5,
                      offset: Offset(3.0, 4.0),
                    )
                  ],
                ),
                //contents
                child: Column(children: [
                  const Text(
                    "Live location",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      //fontFamily: "Visby"
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Let your live location be actively visible to the travellers to let them know if they share the same journey with you.",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextButton(
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut)),
                ]),
              ),
            ],
          ),
        ),
//page 3 walkthorugh
        Container(
          decoration: const BoxDecoration(
              //bg image
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage("lib/assets/images/Walkthrgh_bg.png"),
                  fit: BoxFit.fitHeight)),
          child: Column(
            children: [
              //dog image
              Container(
                height: screenHeight! / 3,
                width: screenWidth,
                margin: const EdgeInsets.fromLTRB(24, 64, 24, 24),
                decoration: const BoxDecoration(
                    //color: Colors.white,
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage("lib/assets/images/ss3.png"),
                        fit: BoxFit.fitHeight)),
              ),
              //card of content
              Container(
                height: screenHeight! / 3,
                width: screenWidth,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  //shadow box
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(16, 9, 9, 9),
                      blurRadius: 12.0,
                      spreadRadius: 0.5,
                      offset: Offset(3.0, 4.0),
                    )
                  ],
                ),
                //contents
                child: Column(children: [
                  const Text(
                    "Chatting",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      //fontFamily: "Visby"
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Communicating about your journey with your mate and making your doubts about the journey clear and convenient.",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextButton(
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut)),
                ]),
              ),
            ],
          ),
        ),
//page 4 walkthorugh
        Container(
          decoration: const BoxDecoration(
              //bg image
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage("lib/assets/images/Walkthrgh_bg.png"),
                  fit: BoxFit.fitHeight)),
          child: Column(
            children: [
              //dog image
              Container(
                height: screenHeight! / 3,
                width: screenWidth,
                margin: const EdgeInsets.fromLTRB(24, 64, 24, 24),
                decoration: const BoxDecoration(
                    //color: Colors.white,
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage("lib/assets/images/ss4.png"),
                        fit: BoxFit.fitHeight)),
              ),
              //card of content
              Container(
                height: screenHeight! / 3,
                width: screenWidth,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  //shadow box
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(16, 9, 9, 9),
                      blurRadius: 12.0,
                      spreadRadius: 0.5,
                      offset: Offset(3.0, 4.0),
                    )
                  ],
                ),
                //contents
                child: Column(children: [
                  const Text(
                    "Payments",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      //fontFamily: "Visby"
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Fuel and payment share to be clear with your mate.                                                                                                                                ",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextButton(
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut)),
                ]),
              ),
            ],
          ),
        ),
//get started page walkthorugh
        Container(
          decoration: const BoxDecoration(
              //bg image
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage("lib/assets/images/Walkthrgh_bg.png"),
                  fit: BoxFit.fitHeight)),
          child: Column(
            children: [
              //dog image
              Container(
                height: screenHeight! / 3,
                width: screenWidth,
                margin: const EdgeInsets.fromLTRB(24, 64, 24, 24),
                decoration: const BoxDecoration(
                    //color: Colors.white,
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage("lib/assets/images/ss4.png"),
                        fit: BoxFit.fitHeight)),
              ),
              //card of content
              Container(
                  height: screenHeight! / 3,
                  width: screenWidth,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    //shadow box
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(16, 9, 9, 9),
                        blurRadius: 12.0,
                        spreadRadius: 0.5,
                        offset: Offset(3.0, 4.0),
                      )
                    ],
                  ),
                  //contents
                  child: Column(children: [
                    const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        //fontFamily: "Visby"
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Getting familiar with mates and logging in your details to let your identity known to other travellers.                                                                                                  ",
                      textAlign: TextAlign.center,
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextButton(
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool("showHome", true);

                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationRole()));
                        })
                  ])),
            ],
          ),
        ),
      ]),
//fixed bootom sheet for page indicators
      bottomSheet: Container(
          alignment: Alignment.center,
          height: 100,
          color: Colors.white,
          child: SmoothPageIndicator(
            controller: controller,
            count: 5,
            effect: const WormEffect(
              radius: 100,
              dotWidth: 16,
              dotHeight: 8,
              spacing: 16,
              dotColor: Colors.black12,
              activeDotColor: Colors.black,
            ),
          )),
    );
  }
}
