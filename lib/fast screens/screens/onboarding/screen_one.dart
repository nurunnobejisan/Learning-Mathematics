import 'package:jisan/fast%20screens/constants/constants.dart';
import 'package:jisan/fast%20screens/screens/onboarding/screen_two.dart';
import 'package:flutter/material.dart';
import 'package:jisan/screens/landing_screen.dart';
import 'components/slanding_clipper.dart';

class OnboardingScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //it will helps to return the size of the screen
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
                image: const AssetImage('assets/images/onboard1.png'),
              ),
              ClipPath(
                clipper: SlandingClipper(),
                child: Container(
                  height: size.height * 0.4,
                  color: Colors.indigoAccent,
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    ' অ্যান্ড্রু উইলস',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: black,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    ' যে কোনও সমস্যা নিয়ে কাজ করা ঠিক আছে, যতক্ষণ না এটি পথে আকর্ষণীয় গণিত তৈরি করে - এমনকি যদি আপনি দিনের শেষে এটি সমাধান না করেন।',
                    textAlign: TextAlign.end,

                    style: TextStyle(
                      fontSize: 18,color: white,
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
                      color: white),
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
                      color: yellow),
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
                          color: Colors.black,
                        ),

                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: white,
                            fontSize: 30.0,

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
                          builder: (_) => OnboardingScreenTwo(),
                        ),
                      );
                    },
                    backgroundColor: white,
                    child: const Icon(
                      Icons.navigate_next_rounded,
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
