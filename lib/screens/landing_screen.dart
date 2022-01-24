import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jisan/screens/product_item.dart';
import 'package:jisan/screens/product_page.dart';
import 'package:jisan/utils/constants.dart';
import 'package:jisan/utils/widget_functions.dart';

const PRODUCT_DATA = [
  {"image": "patygonet.png", "name": "পাটিগণিত", "rest": "Chittagong district", "rating": "4.5 ", "article number": 20, },
  {"image": "bejgonit.png", "name": "বীজগণিত", "rest": "Rangpur District", "rating": "4.7 ", "article number": 10, },
  {"image": "trikonomiti.png", "name": "ত্রিকোণমিতি", "rest": "Rajshahi district.", "rating": "4.2 ", "article number": 10, },
  {"image": "porimiti.png", "name": "পরিমিতি", "rest": "Jashore district", "rating": "3.9 ", "article number": 15, },
  {"image": "gonitalocona.png", "name": "গণিত আলোচনা", "rest": "Sylhet district", "rating": "3.9 ", "article number": 15, },
  {"image": "ganitikjuktiodokotha.png","name":"যুক্তি ও দক্ষতা", "rest": "Comilla district", "rating": "3.9 ", "article number": 15, },
  {"image": "jamati.png", "name": "জ্যামিতি", "rest": "Mymensingh district", "rating": "3.9 ", "article number": 15, },
];

const CATEGORIES = [
  {"image": "math game.png", "name": "Math Game"},
  {"image": "math quiz.png", "name": "Math Quiz"},
  {"image": "calculter.png", "name": "Calculter"},
  {"image": "age calcuter.png", "name": "Age Cal"},
  {"image": "BMI Cal.png", "name": "BMI Cal"},
  {"image": "currency.png", "name": "Currency"},
  {"image": "temperature.png", "name": "Temperate"},
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
                                        borderRadius: BorderRadius.circular(50.0),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Image.asset("assets/images/avatar.png"),
                                      )),
                                  addHorizontalSpace(60),
                                  Expanded(
                                    flex: 8,
                                    child: Text(
                                      "“Pure mathematics is in its way, the poetry of logical ideas.”\n- Albert Einstein.",
                                      style: textTheme.headline5!.apply(color: Colors.white)
                                    ),

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
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0), borderSide: BorderSide.none),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: Container(
                                    height: 5,
                                    width:  5,
                                    decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0))),
                                    child: Icon(
                                      Icons.menu,
                                      color: Colors.black,
                                    ),
                                  ),
                                  fillColor: Colors.grey.shade100,
                                  filled: true,),
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
                                Text(
                                  "   Articles about Math",
                                  style: textTheme.headline5,
                                ),
                                Expanded(
                                  child: Center(),
                                ),
                                Text(
                                  "View Articles > ",
                                  style: textTheme.subtitle2!.apply(color: COLOR_ORANGE),
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
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage(productData: data)));
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
                        Positioned(
                          top: -40,
                          left: 0,
                          child: Container(
                            width: constraints.maxWidth,
                            height: constraints.maxWidth * 0.35,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              children: CATEGORIES
                                  .map((category) => Container(
                                margin: const EdgeInsets.only(right: 10.0),
                                width: constraints.maxWidth * 0.25,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Image.asset("assets/images/${category['image']}"),
                                      addVerticalSpace(10),
                                      Text(
                                        "${category['name']}",
                                        style: textTheme.bodyText2!.apply(color: COLOR_BLACK),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                                  .toList(),
                            ),
                          ),
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
}