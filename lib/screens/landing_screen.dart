
import 'package:flutter/material.dart';
import 'package:jisan/Age/views/home.dart';
import 'package:jisan/BMI/input_page.dart';
import 'package:jisan/Mathgame/math.dart';
import 'package:jisan/convetor&currency/Convetor.dart';
import 'package:jisan/convetor&currency/currency.dart';
import 'package:jisan/screens/product_item.dart';
import 'package:jisan/screens/product_page.dart';
import 'package:jisan/utils/constants.dart';
import 'package:jisan/utils/widget_functions.dart';

const PRODUCT_DATA = [
  {
    "image": "patygonet.png",
    "name": "পাটিগণিত",
    "rest": "Nurunnobe Jomadder",
    "rating": "4.5 ",
    "article number": 20,
  },
  {
    "image": "bejgonit.png",
    "name": "বীজগণিত",
    "rest": "MD Al Amin Mia",
    "rating": "4.7 ",
    "article number": 10,
  },
  {
    "image": "trikonomiti.png",
    "name": "ত্রিকোণমিতি",
    "rest": "Zihadul Islam",
    "rating": "4.2 ",
    "article number": 10,
  },
  {
    "image": "porimiti.png",
    "name": "পরিমিতি",
    "rest": "HM Imam Hossan",
    "rating": "3.9 ",
    "article number": 15,
  },
  {
    "image": "gonitalocona.png",
    "name": "গণিত আলোচনা",
    "rest": "ER Jebon",
    "rating": "3.9 ",
    "article number": 15,
  },
  {
    "image": "ganitikjuktiodokotha.png",
    "name": "যুক্তি ও দক্ষতা",
    "rest": "Comilla district",
    "rating": "3.9 ",
    "article number": 15,
  },
  {
    "image": "jamati.png",
    "name": "জ্যামিতি",
    "rest": "Phis Khan II",
    "rating": "3.9 ",
    "article number": 15,
  },
];

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                    flex: 4,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          color: COLOR_GREEN,
                        ),
                        Image.asset("assets/images/background.png"),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Image.asset(
                                            "assets/images/avatar.png"),
                                      )),
                                  addHorizontalSpace(60),
                                  Expanded(
                                    flex: 8,
                                    child: Text(
                                        "“Pure mathematics is in its way, the poetry of logical ideas.”\n- Albert Einstein.",
                                        style: textTheme.headline5!
                                            .apply(color: Colors.white)),
                                  )
                                ],
                              ),
                              TextField(
                                focusNode: _focusNode,
                                cursorColor: Colors.blueAccent,
                                cursorRadius: Radius.circular(20.0),
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: " গণিত বিষয়ে অনুসন্ধান করুন",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                      borderSide: BorderSide.none),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: Container(
                                    height: 5,
                                    width: 5,
                                    decoration: BoxDecoration(
                                        color: Colors.white24,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20.0),
                                            bottomRight:
                                                Radius.circular(20.0))),
                                    child: InkWell(
                                      child: Icon(
                                        Icons.menu,
                                        color: Colors.black,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomePage(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                ),
                              ),
                              addVerticalSpace(20),
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  width: constraints.maxWidth,
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0, bottom: 0.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          children: [
                            addVerticalSpace(constraints.maxWidth * 0.35),
                            Row(
                              children: [
                                InkWell(
                                  child: Text(
                                    "   Math Game",
                                    style: textTheme.headline5,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Math(),
                                      ),
                                    );
                                  },
                                ),
                                Expanded(
                                  child: Center(),
                                ),
                                InkWell(
                                  child: Text(
                                    "Currency > ",
                                    style: textTheme.subtitle2!
                                        .apply(color: COLOR_ORANGE),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => currency(),
                                      ),
                                    );
                                  },
                                ),
                                addHorizontalSpace(10),
                              ],
                            ),
                            addVerticalSpace(10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: Row(
                                children: PRODUCT_DATA
                                    .map((data) => InkWell(
                                          onTap: () {
                                            _focusNode.unfocus();
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductPage(
                                                            productData:
                                                                data)));
                                          },
                                          child: ProductItem(
                                            width: constraints.maxWidth * 0.50,
                                            productData: data,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                        //sir problem on tap
                        Positioned(
                          top: -40,
                          left: 0,
                          child: Container(
                              width: constraints.maxWidth,
                              height: constraints.maxWidth * 0.45,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      child: ListTile(
                                          'Math Game',
                                          Image.asset(
                                            'assets/images/math game.png',
                                            height: 70,
                                            width: 80,
                                          ),
                                          const Color(0xFF6FC5DA)),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Math(),
                                          ),
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: ListTile(
                                          'Math Quiz',
                                          Image.asset(
                                            'assets/images/math quiz.png',
                                            height: 82,
                                            width: 80,
                                          ),
                                          const Color(0xFF6FC5DA)),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Math(),
                                          ),
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: ListTile(
                                          'Calculter',
                                          Image.asset(
                                            'assets/images/calculter.png',
                                            height: 82,
                                            width: 80,
                                          ),
                                          const Color(0xFF6FC5DA)),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Math(),
                                          ),
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: ListTile(
                                          'Age Cal',
                                          Image.asset(
                                            'assets/images/age calcuter.png',
                                            height: 82,
                                            width: 80,
                                          ),
                                          const Color(0xFF6FC5DA)),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomePage(),
                                          ),
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: ListTile(
                                          'BMI Cal',
                                          Image.asset(
                                            'assets/images/BMI Cal.png',
                                            height: 82,
                                            width: 80,
                                          ),
                                          const Color(0xFF6FC5DA)),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => InputPage(),
                                          ),
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: ListTile(
                                          'Temperature',
                                          Image.asset(
                                            'assets/images/temperature.png',
                                            height: 82,
                                            width: 80,
                                          ),
                                          const Color(0xFF6FC5DA)),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => convector(),
                                          ),
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: ListTile(
                                          'Currency',
                                          Image.asset(
                                            'assets/images/currency.png',
                                            height: 82,
                                            width: 80,
                                          ),
                                          const Color(0xFF6FC5DA)),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => currency(),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 25.0)
                                  ])),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  ListTile(String name, Image iconName, Color bgColor) {
    return Padding(
        padding: const EdgeInsets.only(right: 10, left: 5),
        child: Column(children: [
          const SizedBox(height: 19),
          Container(
              padding: const EdgeInsets.only(right: 10, left: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.20)),
              child: Center(child: iconName)),
          const SizedBox(height: 20.0),
          Container(
              width: 60.0,
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 12.0,
                          color: Color(0xFF3C2960)))))
        ]));
  }
}
