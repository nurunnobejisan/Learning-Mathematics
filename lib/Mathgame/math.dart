import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jisan/Mathgame/constants/app_constant.dart';
import 'package:jisan/Mathgame/widgets/main_list.dart';

class Math extends StatefulWidget {
  const Math({Key? key}) : super(key: key);

  @override
  State<Math> createState() => _Math();
}

class _Math extends State<Math> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Sabitler.mainbackgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.indigoAccent,
              title: Sabitler.appBarTitle,
              titleTextStyle: GoogleFonts.openSans(
                  textStyle: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            body: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                child: const MainList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
