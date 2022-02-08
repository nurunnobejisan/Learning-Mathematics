import 'package:flutter/material.dart';
import 'package:jisan/Mathgame/constants/app_constant.dart';
import 'package:jisan/Mathgame/pages/division_page.dart';
import 'package:jisan/Mathgame/pages/multiplication_page.dart';
import 'package:jisan/Mathgame/pages/extraction_page.dart';
import 'package:jisan/Mathgame/pages/addition_page.dart';
import 'package:jisan/screens/landing_screen.dart';

class MainList extends StatelessWidget {
  const MainList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double yourHeight = height * 0.15;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const LandingScreen(),
                ));
          },),
        SizedBox(
          height: yourHeight,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ToplamaOyunu()),
              );
            },
            child: Card(
              shape: Sabitler.plusGameShape,
              color: Sabitler.plusGameColor,
              child: Center(
                  child: Sabitler.createListTile(0xff232323, "যোগ", "+")),
            ),
          ),
        ),
        SizedBox(
          height: yourHeight,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CikartmaOyunu()),
              );
            },
            child: Card(
              shape: Sabitler.minusGameShape,
              color: Sabitler.minusGameColor,
              child: Center(
                child: Sabitler.createListTile(0xff232323, "বিয়োগ", "-"),
              ),
            ),
          ),
        ),
        SizedBox(
          height: yourHeight,
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BolmeOyunu()));
            },
            child: Card(
              shape: Sabitler.divideGameShape,
              color: Sabitler.divideGameColor,
              child: Center(
                  child: Sabitler.createListTile(0xff232323, "ভাগ", "/")),
            ),
          ),
        ),
        SizedBox(
          height: yourHeight,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CarpmaOyunu()),
              );
            },
            child: Card(
              shape: Sabitler.multiplyGameShape,
              color: Sabitler.multiplyGameColor,
              child: Center(
                  child: Sabitler.createListTile(0xff232323, "গুন", "*")),
            ),
          ),
        ),
      ],
    );
  }
}
