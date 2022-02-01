import 'package:jisan/screens/landing_screen.dart';
import 'package:jisan/fast%20screens/constants/constants.dart';
import 'package:jisan/fast%20screens/screens/onboarding/components/slanding_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class OnboardingScreenThree extends StatelessWidget {
  const OnboardingScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                width: size.width,
                height: size.height * 0.6,
                fit: BoxFit.cover,
                image: const AssetImage('assets/images/onboard3.png'),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: ClipPath(
                  clipper: SlandingClipper(),
                  child: Container(
                    height: size.height * 0.4,
                    color: Colors.indigoAccent,
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: size.height * 0.65,
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(appPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'শকুন্তলা দেবী',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    ' গণিত ছাড়া, আপনি কিছুই করতে পারবেন না। আপনার চারপাশের সবকিছুই গণিত। আপনার চারপাশের সবকিছুই সংখ্যা।',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 25,color: white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: appPadding / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle,
                      color: yellow),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: appPadding / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: black, width: 2),
                      shape: BoxShape.circle,
                      color: yellow),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: appPadding / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: black, width: 2),
                      shape: BoxShape.circle,
                      color: white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: appPadding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const LandingScreen(),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white,
                        ),

                        child: const InkWell(
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: black,
                              fontSize: 30.0,

                            ),
                          ),
                        ),

                      ),

                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: appPadding),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LandingScreen(),
                        ),
                      );
                    },
                    backgroundColor: white,
                    child: const Icon(
                      Icons.done_rounded,
                      color: black,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
