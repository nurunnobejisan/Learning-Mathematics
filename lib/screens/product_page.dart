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
          return Container(
            height: constraints.maxHeight,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          height: constraints.maxHeight * 0.40,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffE2F3D4),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/${widget.productData['image']}",
                                    width: constraints.maxWidth * 0.50,
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
                                    buttonColor: Colors.orange.shade100,
                                    iconColor: Colors.orange,
                                  ))
                            ],
                          ),
                        ),
                        addVerticalSpace(10),
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
                                    addVerticalSpace(20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${widget.productData['name']}",
                                              style: textTheme.headline5,
                                            ),
                                            addVerticalSpace(5),
                                            RichText(
                                                overflow: TextOverflow.ellipsis,
                                                text: TextSpan(children: [
                                                  WidgetSpan(child: Icon(Icons.location_on, color: Colors.red, size: 15)),
                                                  TextSpan(text: "${widget.productData['rest']}", style: textTheme.subtitle2!.apply(color: COLOR_GREY))
                                                ])),
                                          ],
                                        ),
                                        RichText(
                                            textAlign: TextAlign.right,
                                            overflow: TextOverflow.ellipsis,
                                            text: TextSpan(children: [
                                              TextSpan(text: "${widget.productData['article number']}", style: textTheme.headline5!.apply(color: COLOR_ORANGE))
                                            ])),
                                      ],
                                    ),
                                    addVerticalSpace(20),
                                    Divider(),
                                    Container(
                                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(children: [
                                                WidgetSpan(child: Icon(Icons.star, color: Colors.orange, size: 15)),
                                                TextSpan(text: "${widget.productData['rating']}", style: textTheme.bodyText2!.apply(fontWeightDelta: 4))
                                              ])),
                                          RichText(
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(children: [
                                                WidgetSpan(child: Icon(Icons.format_size_sharp, color: Colors.red, size: 15)),
                                                TextSpan(text: " বীজগনিতীয় রাশি", style: textTheme.bodyText2!.apply(fontWeightDelta: 4))
                                              ])),
                                          RichText(
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(children: [
                                                WidgetSpan(child: Icon(Icons.next_plan_outlined, color: Colors.indigoAccent, size: 15)),
                                                TextSpan(text: "Next" , style: textTheme.bodyText2!.apply(fontWeightDelta: 4))
                                              ])),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    Text(
                                      "বীজগনিতীয় রাশির সূত্র সমূহ",
                                      style: textTheme.headline6,
                                    ),
                                    addVerticalSpace(10),
                                    Text(
                                      " ☞ (a+b)²= a²+2ab+b² \n ☞ (a+b)²= (a-b)²+4ab \n ☞ (a-b)²= a²-2ab+b² \n ☞ (a-b)²= (a+b)²-4ab \n ☞ a² + b²= (a+b)²-2ab. \n ☞ a² + b²= (a-b)²+2ab. \n ☞ a²-b²= (a +b)(a -b) \n ☞ 2(a²+b²)= (a+b)²+(a-b)² \n ☞ 4ab = (a+b)²-(a-b)² \n ☞ ab = {(a+b)/2}²-{(a-b)/2}² \n ☞ (a+b+c)² = a²+b²+c²+2(ab+bc+ca) \n ☞ (a+b)³ = a³+3a²b+3ab²+b³ \n ☞ (a+b)³ = a³+b³+3ab(a+b) \n ☞ (a-b)³= a³-3a²b+3ab²-b³ \n ☞ (a-b)³= a³-b³-3ab(a-b) \n ☞ a³+b³= (a+b) (a²-ab+b²) \n ☞ a³+b³= (a+b)³-3ab(a+b) \n ☞ a³-b³ = (a-b) (a²+ab+b²) \n ☞ a³-b³ = (a-b)³+3ab(a-b) \n ☞ (a2 + b2 + c2) = (a + b + c) 2 – 2(ab + bc + ca) \n ☞ 2 (ab + bc + ca) = (a + b + c) 2 – (a2 + b2 + c2) \n ☞ (a + b + c) 3 = a3 + b3 + c3 + 3 (a + b) (b + c) (c + a) \n ☞ a3 + b3 + c3 – 3abc = (a+b+c)(a2 + b2+ c2–ab–bc– ca) \n ☞ a3 + b3 + c3 – 3abc = (a+b+c) { (a–b) 2+(b–c) 2+(c–a) 2} \n  --------------------------------------------   \n ☞ (x + a) (x + b) = x2 + (a + b) x + ab \n ☞ (x + a) (x – b) = x2 + (a – b) x – ab \n ☞ (x – a) (x + b) = x2 + (b – a) x – ab \n ☞ (x – a) (x – b) = x2 – (a + b) x + ab \n ☞ (x+p) (x+q) (x+r) = x3 + (p+q+r) x2 + (pq+qr+rp) x +pqr",
                                      style: textTheme.subtitle2!.apply(heightDelta: 2.0),
                                    ),
                                    addVerticalSpace(100),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: -35,
                                right: 20,
                                child: InkWell(
                                  onTap: () {
                                    Fluttertoast.showToast(msg: "Share Done");
                                  },
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration:
                                    BoxDecoration(shape: BoxShape.circle, color: Colors.red, boxShadow: [BoxShadow(color: Colors.red.withOpacity(0.2), blurRadius: 10.0, spreadRadius: 5.0)]),
                                    child: Icon(
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
                ),
                if (!addedToCart) ...[
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.12,
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)), color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SlideAction(
                          text: "        share with friends",
                          key: _buttonKey,
                          sliderButtonIcon: Icon(
                            Icons.share_rounded,
                            color: Colors.white,
                          ),
                          onSubmit: () {
                            Future.delayed(Duration(seconds: 1), () {
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