import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jisan/Age/views/home.dart';
import 'package:jisan/BMI/input_page.dart';
import 'package:jisan/Game/game.dart';
import 'package:jisan/Mathgame/math.dart';
import 'package:jisan/convetor&currency/Convetor.dart';
import 'package:jisan/convetor&currency/button.dart';
import 'package:jisan/convetor&currency/dashPages/currency.dart';
import 'package:jisan/convetor&currency/dashPages/time.dart';
import 'package:jisan/popmore/about%20me.dart';
import 'package:jisan/popmore/listview.dart';
import 'package:jisan/screens/product.dart';
import 'package:jisan/screens/product_item.dart';
import 'package:jisan/screens/product_page.dart';
import 'package:jisan/utils/widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:get/get.dart';

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
                        CarouselSlider(
                          items: [
                            Container(
                              margin:
                              const EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/Qutes.png"),
                                      fit: BoxFit.fill)),
                            ),
                            Container(
                                margin:
                                const EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/Qutes (2).png"),
                                      fit: BoxFit.fill),
                                )),
                            Container(
                                margin:
                                const EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey,
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/Qutes (3).png"),
                                        fit: BoxFit.fill))),
                            Container(
                                margin:
                                const EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey,
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/Qutes (4).png"),
                                        fit: BoxFit.fill))),
                            Container(
                                margin:
                                const EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey,
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/Qutes (5).png"),
                                        fit: BoxFit.fill))),
                            Container(
                                margin:
                                const EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey,
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/Qutes (6).png"),
                                        fit: BoxFit.fill))),
                          ],

                          options: CarouselOptions(
                            height: 250.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 9 / 16,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                            viewportFraction: 0.7,
                            pageSnapping: true,
                          ),
                        ),

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
                                    " আরও দেখুন>> ",
                                    style: textTheme.headline5,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const listview(),
                                      ),
                                    );
                                  },
                                ),
                                const Expanded(
                                  child: Center(),
                                ),
                                InkWell(
                                    child: MyPopupMenu(
                                      child: Icon(
                                        Icons.menu,
                                        key: GlobalKey(),
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ),
                                ),
                                addHorizontalSpace(10),
                              ],
                            ),
                            addVerticalSpace(10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
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
                          child: SizedBox(
                              width: constraints.maxWidth,
                              height: constraints.maxWidth * 0.45,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      child: ListTile(
                                          'গণিত খেলা',
                                          Image.asset(
                                            'assets/images/math game.png',
                                            height: 80,
                                            width: 80,
                                          ),
                                          const Color(0xFF6FC5DA)),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const game(),
                                          ),
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: ListTile(
                                          'গণিত কুইজ',
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
                                            builder: (context) => const Math(),
                                          ),
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: ListTile(
                                          'ক্যালকুলেটর',
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
                                            builder: (context) => const Calculator(),
                                          ),
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: ListTile(
                                          'বয়স ক্যালকুলেটর',
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
                                            builder: (context) =>
                                            const HomePage(),
                                          ),
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: ListTile(
                                          'BMI ক্যালকুলেটর',
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
                                            builder: (context) =>
                                            const InputPage(),
                                          ),
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: ListTile(
                                          'তাপমাত্রা ক্যালকুলেটর',
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
                                          'মুদ্রা ক্যালকুলেটর',
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
                                            builder: (context) =>const CurrencyConvert(),
                                          ),
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: ListTile(
                                          'বিশ্ব ঘড়ি',
                                          Image.asset(
                                            'assets/images/clock.png',
                                            height: 82,
                                            width: 80,
                                          ),
                                          const Color(0xFF6FC5DA)),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>const TimeConvert(),
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
        padding: const EdgeInsets.only(right: 10,  left: 5),
        child: Column(children: [
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.only(right: 10, left: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.20)),
              child: Center(child: iconName)),
          const SizedBox(height: 20.0),
          SizedBox(
              width: 60.0,
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 11.0,
                          color: Color(0xFF3C2960)))))
        ]));
  }
}

class GraphClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();

    //Cut the path
    p.moveTo(0, 0);
    p.lineTo(size.width * .3, size.height);
    p.lineTo(size.width * .7, size.height);
    p.lineTo(size.width, 0);
    p.close();

    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyPopupMenu extends StatefulWidget {
  final Widget child;

  MyPopupMenu({Key? key, required this.child})
      : assert(child.key != null),
        super(key: key);

  @override
  _MyPopupMenuState createState() => _MyPopupMenuState();
}

class _MyPopupMenuState extends State<MyPopupMenu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.child,
      onTap: _showPopupMenu,
    );
  }

  void _showPopupMenu() {
    //Find renderbox object
    RenderBox renderBox = (widget.child.key as GlobalKey)
        .currentContext
        ?.findRenderObject() as RenderBox;
    Offset position = renderBox.localToGlobal(Offset.zero);

    showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return PopupMenuContent(
            position: position,
            size: renderBox.size,
            onAction: (x) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 1),
                content: Text('Action => $x'),
              ));
            },
          );
        });
  }
}

class PopupMenuContent extends StatefulWidget {
  final Offset position;
  final Size size;
  final ValueChanged<String>? onAction;

  const PopupMenuContent(
      {Key? key, required this.position, required this.size, this.onAction})
      : super(key: key);

  @override
  _PopupMenuContentState createState() => _PopupMenuContentState();
}

class _PopupMenuContentState extends State<PopupMenuContent>
    with SingleTickerProviderStateMixin {
  //Let's create animation
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _closePopup("");
        return false;
      },
      child: GestureDetector(
        onTap: () => _closePopup(""),
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right:
                  (MediaQuery.of(context).size.width - widget.position.dx) -
                      widget.size.width,
                  top: widget.position.dy,
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _animation.value,
                        alignment: Alignment.topRight,
                        child: Opacity(opacity: _animation.value, child: child),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        margin: const EdgeInsets.only(left: 64),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(34),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 8,
                              )
                            ]),
                        child: Column(
                          children: [
                            //Repeat now
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const about()));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFF0E3),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: const Icon(
                                      Icons.info_outlined,
                                      color: Colors.red,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "আমাদের সম্পর্কে",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.7),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            //Edit workout
                            const SizedBox(
                              height: 10,
                            ),

                            GestureDetector(
                              onTap: () => _closePopup("গোপনীয়তা নীতি"),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE1E1FC),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: const Icon(
                                      Icons.privacy_tip_outlined,
                                      color: Color(0xFF3840A2),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "গোপনীয়তা নীতি",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.7),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            //Share workout
                            const SizedBox(
                              height: 10,
                            ),

                            GestureDetector(
                              onTap: () => _closePopup("এখন শেয়ার করুন"),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDDF3FD),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: const Icon(
                                      Icons.share,
                                      color: Color(0xFF0586C0),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "এখন শেয়ার করুন",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.7),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            GestureDetector(
                              onTap: () {
                                if (Platform.isAndroid) {
                                  SystemNavigator.pop();
                                } else {
                                  exit(0);
                                }
                              },
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: const Icon(
                                      Icons.exit_to_app_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "প্রস্থান",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.7),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            //Chat box
                            const SizedBox(
                              height: 10,
                            ),

                            GestureDetector(
                              onTap: () => _closePopup("সহায়তা পান"),
                              child: Container(
                                width: double.maxFinite,
                                height: 70,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFC2E3F6),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.messenger_outline_rounded,
                                        color: Color(0xff1e93ad),
                                        size: 26,
                                      ),

                                      Text(
                                        "সহায়তা পান",
                                        style: TextStyle(
                                            color: Color(0xff1e93ad),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _closePopup(String action) {
    _animationController.reverse().whenComplete(() {
      Navigator.of(context).pop();

      if (action.isNotEmpty) widget.onAction?.call(action);
    });
  }
}

class TimeCard extends StatelessWidget {
  const TimeCard({
    required this.locName,
    required this.gmt,
    required this.dateTime,
    Key? key,
  }) : super(key: key);

  final String locName;
  final String gmt;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange[200],
      elevation: 3,
      borderOnForeground: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            SizedBox(
              width: 110,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    locName.toUpperCase(),
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    style: GoogleFonts.ibmPlexSans(
                        fontSize: 16, color: Colors.black54),
                  ),
                  Text(
                    gmt.toUpperCase(),
                    style: GoogleFonts.ibmPlexSans(
                        fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                minRadius: 22,
                child: AnalogClock(
                  isLive: true,
                  datetime: dateTime,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridTile extends StatelessWidget {
  const GridTile(
      {Key? key,
        required this.name,
        required this.img,
        required this.whenTapped})
      : super(key: key);

  final String name;
  final String img;
  final VoidCallback whenTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whenTapped,
      child: Container(
        height: 16,
        width: 16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Image.asset(
                  img,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
              child: Text(
                name,
                overflow: TextOverflow.clip,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: GoogleFonts.ibmPlexSans(
                  letterSpacing: 0,
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12.withOpacity(0.05)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0.25,
              blurRadius: 5,
              offset: Offset(4, 4),
            ),
          ],
        ),
      ),
    );
  }
}
