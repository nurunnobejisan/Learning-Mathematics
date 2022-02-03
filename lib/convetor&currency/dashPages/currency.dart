import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jisan/convetor&currency/blocs/currency_bloc.dart';
import 'package:jisan/convetor&currency/models/currency_model.dart';

class CurrencyConvert extends StatefulWidget {
  const CurrencyConvert({Key? key}) : super(key: key);

  @override
  _AreaConvertState createState() => _AreaConvertState();
}

class _AreaConvertState extends State<CurrencyConvert> {
  Map<String, dynamic> allCurr = {};
  List<String> currenciesList = [];
  String? c1;
  String? c2;
  num val1 = 1;
  num val2 = 1;
  @override
  void initState() {
    EasyLoading.show();
    CurrencyBloc().getCurrency().then((value) {
      EasyLoading.dismiss();
      allCurr = value;
      allCurr.forEach((key, value) {
        currenciesList.add(key);
      });
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black54,
          title: Text("মুদ্রা"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    val1.toString(),
                    style: GoogleFonts.ibmPlexSans(
                      letterSpacing: 0,
                      fontSize: 25,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: DropdownSearch(
                        showSearchBox: true,
                        onChanged: (value) {
                          // print(value);
                          c1 = value.toString();
                          if (c2 != null) {
                            val2 = val1 * (allCurr[c2] / allCurr[c1]);
                            setState(() {});
                          }
                        },
                        items: currenciesList),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              height: 100,
              color: Colors.indigoAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      val2.toString(),
                      style: GoogleFonts.ibmPlexSans(
                        letterSpacing: 0,
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: DropdownSearch(
                        showSearchBox: true,
                        onChanged: (value) {
                          //  print(value);
                          c2 = value.toString();
                          val2 = val1 * (allCurr[c2] / allCurr[c1]);
                          setState(() {});
                        },
                        items: currenciesList),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
