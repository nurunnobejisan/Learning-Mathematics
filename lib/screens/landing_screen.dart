import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jisan/screens/product_item.dart';
import 'package:jisan/screens/product_page.dart';
import 'package:jisan/utils/constants.dart';
import 'package:jisan/utils/widget_functions.dart';

const PRODUCT_DATA = [
  {"image": "patygonet.png", "name": "Nurunnobe Jomadder", "rest": "Chittagong district", "rating": "4.5 ", "article number": 20, },
  {"image": "burger.png", "name": "Ishak Howlader", "rest": "Rangpur District", "rating": "4.7 ", "article number": 10, },
  {"image": "bejgonit.png", "name": "MD alamin mia", "rest": "Rajshahi district.", "rating": "4.2 ", "article number": 10, },
  {"image": "jamati.png", "name": "Zihadul Islam", "rest": "Jashore district", "rating": "3.9 ", "article number": 15, },
  {"image": "porimiti.png", "name": "Shahrear Tomal", "rest": "Sylhet district", "rating": "3.9 ", "article number": 15, },
  {"image": "ganitikjuktiodokotha.png", "name": "Dinajpur district", "rest": "Comilla district", "rating": "3.9 ", "article number": 15, },
  {"image": "bejgonit.png", "name": "Reasel Hassan", "rest": "Mymensingh district", "rating": "3.9 ", "article number": 15, },
];

const CATEGORIES = [
  {"image": "patygonet.png", "name": "পাটিগণিত"},
  {"image": "bejgonit.png", "name": "বীজগণিত"},
  {"image": "bejgonit.png", "name": "ত্রিকোণমিতি"},
  {"image": "bejgonit.png", "name": "জ্যামিতি"},
  {"image": "porimiti.png", "name": "পরিমিতি"},
  {"image": "porimiti.png", "name": "গণিত আলোচনা"},
  {"image": "porimiti.png", "name": "গানিতিক যুক্তি ও দক্ষতা"},
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
            return Container(
              child: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            color: COLOR_GREEN,
                          ),
                          Image.asset("assets/images/jamati.png"),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset("assets/images/avatar.png"),
                                        )),
                                    addHorizontalSpace(20),
                                    Expanded(
                                      flex: 7,
                                      child: Text(
                                        "“Pure mathematics is in its way, the poetry of logical ideas.”\n- Albert Einstein.",
                                        style: textTheme.headline5!.apply(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                                TextField(
                                  focusNode: _focusNode,
                                  cursorColor: Colors.white,
                                  cursorRadius: Radius.circular(10.0),
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      hintText: "গণিত বিষয়ে অনুসন্ধান করুন",
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide.none),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                      suffixIcon: Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0))),
                                        child: Icon(
                                          Icons.menu,
                                          color: Colors.white,
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white24),
                                ),
                                addVerticalSpace(10),
                              ],
                            ),
                          )
                        ],
                      )),
                  Container(
                    width: constraints.maxWidth,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            children: [
                              addVerticalSpace(constraints.maxWidth * 0.35),
                              Row(
                                children: [
                                  Text(
                                    "Articles about Math",
                                    style: textTheme.headline5,
                                  ),
                                  Expanded(
                                    child: Center(),
                                  ),
                                  Text(
                                    "View All > ",
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
              ),
            );
          },
        ),
      ),
    );
  }
}