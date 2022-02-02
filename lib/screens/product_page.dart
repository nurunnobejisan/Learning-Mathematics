import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jisan/utils/button.dart';
import 'package:jisan/utils/constants.dart';
import 'package:jisan/utils/widget_functions.dart';
import 'package:slide_to_act/slide_to_act.dart';

class ProductPage extends StatefulWidget {
  final Map<String, dynamic> productData;

  const ProductPage({Key? key, required this.productData}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final GlobalKey<SlideActionState> _buttonKey = GlobalKey<SlideActionState>();
  bool addedToCart = false; // Just for Demonstration

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.40,
                        child: Stack(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffb8a7f1),
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/${widget.productData['image']}",
                                  width: constraints.maxWidth * 0.80,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 10,
                                left: 10,
                                child: SquareIconButton(
                                  icon: Icons.arrow_back_ios_outlined,
                                  width: 50,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  buttonColor: Colors.indigo,
                                  iconColor: Colors.white,
                                ))
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey.shade50,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${widget.productData['name']}",
                                            style: textTheme.headline5,
                                          ),
                                          RichText(
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(children: [
                                                const WidgetSpan(
                                                    child: Icon(
                                                        Icons.auto_fix_normal,
                                                        color: Colors.red,
                                                        size: 15)),
                                                TextSpan(
                                                    text:
                                                        "${widget.productData['rest']}",
                                                    style: textTheme.subtitle2!
                                                        .apply(
                                                            color: COLOR_GREY))
                                              ])),
                                        ],
                                      ),
                                      RichText(
                                          textAlign: TextAlign.right,
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "${widget.productData['article number']}",
                                                style: textTheme.headline5!
                                                    .apply(color: COLOR_ORANGE))
                                          ])),
                                    ],
                                  ),
                                  const Divider(),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            overflow: TextOverflow.ellipsis,
                                            text: TextSpan(children: [
                                              const WidgetSpan(
                                                  child: Icon(Icons.star,
                                                      color:
                                                          Colors.indigoAccent,
                                                      size: 20)),
                                              TextSpan(
                                                  text:
                                                      "${widget.productData['rating']}",
                                                  style: textTheme.bodyText2!
                                                      .apply(
                                                          fontWeightDelta: 4))
                                            ])),
                                        RichText(
                                            overflow: TextOverflow.ellipsis,
                                            text: const TextSpan(children: [
                                              WidgetSpan(
                                                  child: InkWell(
                                                    child: Icon(
                                                Icons.emoji_emotions_rounded,
                                                color: Colors.indigoAccent,
                                                size: 20,

                                              ),
                                                  )


                                              ),
                                            ])),
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: "${widget.productData['article2']}",
                                      style: textTheme.headline6,
                                    )
                                  ])),
                                  addVerticalSpace(10),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: "${widget.productData['article']}",
                                      style: textTheme.subtitle2!
                                          .apply(heightDelta: 2.0),
                                    )
                                  ])),
                                  addVerticalSpace(100),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -35,
                              right: 20,
                              child: InkWell(
                                onTap: () {
                                  Fluttertoast.showToast(
                                      msg: "শেয়ার করা হয়েছে");
                                },
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.red.withOpacity(0.2),
                                            blurRadius: 10.0,
                                            spreadRadius: 5.0)
                                      ]),
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 35.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (!addedToCart) ...[
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.12,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SlideAction(
                          text: "        বন্ধুদের সাথে শেয়ার করুন",
                          key: _buttonKey,
                          sliderButtonIcon: const Icon(
                            Icons.share_rounded,
                            color: Colors.white,
                          ),
                          onSubmit: () {
                            Future.delayed(const Duration(seconds: 1), () {
                              setState(() {
                                addedToCart = true;
                              });
                              // _buttonKey.currentState!.reset();
                            });
                          },
                          sliderRotate: false,
                          borderRadius: 10.0,
                          elevation: 0,
                          innerColor: COLOR_GREEN,
                          outerColor: Colors.grey.shade100,
                        ),
                      ),
                    ),
                  )
                ]
              ],
            ),
          );
        }),
      ),
    );
  }
}
