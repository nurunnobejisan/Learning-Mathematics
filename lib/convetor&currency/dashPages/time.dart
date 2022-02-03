import 'package:analog_clock/analog_clock.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jisan/convetor&currency/blocs/time_bloc.dart';
import 'package:jisan/convetor&currency/models/time_model.dart';

class TimeConvert extends StatefulWidget {
  const TimeConvert({Key? key}) : super(key: key);

  @override
  _AreaConvertState createState() => _AreaConvertState();
}

class _AreaConvertState extends State<TimeConvert> {
  List<dynamic> timeZones = [];
  List<dynamic> searchResult = [];
  String? selectedZone;
  TimeModel time = TimeModel();
  int? mm;
  int? hh;
  int? ss;

  @override
  void initState() {
    EasyLoading.show();
    TimeBloc().getTimeZones().then((value) {
      timeZones = value;
      searchResult = timeZones;
      EasyLoading.dismiss();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("সময় অঞ্চলসমূহ"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black54,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "টাইমজোন নির্বাচন করুন",
                style: GoogleFonts.ibmPlexSans(
                  letterSpacing: 0,
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: DropdownSearch<dynamic>(
                onChanged: (value) async {
                  selectedZone = value.toString();
                  EasyLoading.show();
                  try {
                    TimeBloc()
                        .getTimeZone(selectedZone.toString())
                        .then((value) {
                      EasyLoading.dismiss();
                      value.datetime = value.datetime!.replaceAll("T", " ");
                      value.datetime = value.datetime!
                          .substring(0, value.datetime!.indexOf("+"));
                      setState(() {
                        time = value;
                      });
                    });
                  } catch (e) {
                    EasyLoading.dismiss();
                    rethrow;
                  }
                },
                showSearchBox: true,
                mode: Mode.BOTTOM_SHEET,
                items: timeZones,
                hint: "সময় অঞ্চল নির্বাচন করুন",
              ),
            ),
            time.datetime == ""
                ? Container()
                : Container(
                    height: 300,
                    width: 300,
                    child: AnalogClock(
                      key: UniqueKey(),
                      isLive: true,
                      datetime: DateTime.parse(time.datetime!),
                    ),
                  ),
          ],
        ));
  }
}
