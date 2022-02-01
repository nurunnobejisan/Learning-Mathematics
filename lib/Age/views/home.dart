import 'package:jisan/Age/constant/color.dart';
import 'package:jisan/Age/global/helper_function.dart';
import 'package:jisan/Age/global/utils.dart';
import 'package:jisan/Age/views/result.dart';
import 'package:jisan/Age/widget/app_name.dart';
import 'package:jisan/Age/widget/custom_bottom_paint.dart';
import 'package:jisan/Age/widget/custom_large_button.dart';
import 'package:jisan/Age/widget/custom_top_paint.dart';
import 'package:jisan/Age/widget/date_picker_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              CustomPaint(
                size: Size(width, (350 * 0.31473214285714285).toDouble()),
                painter: CustomTopPaint(),
              ),
              const Positioned(
                top: 30,
                child: AppName()
              )
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'আপনার বয়স ঠিক কত এবং আপনার পরবর্তী জন্মদিন পর্যন্ত কত দিন আছে তা আবিষ্কার করুন।',
              style: TextStyle(
                fontSize: 18,
                height: 1.5,
                fontWeight: FontWeight.w400,
                fontFamily: 'roboto',
                color: textColor ,
              ),
            ),
          ),
          const Spacer(),
          Image.asset("assets/images/age calcuter.png",width: 120,
              height: 120,
              ),

          const Spacer(),
          DatePickerField(
            level: 'জন্ম তারিখ নির্বাচন করুন',
            onTap: ()=> _selectDate(context, selectedBithDate, "BirthDate" ),
            hintText: getFormatedDate(selectedBithDate),
          ),
          const SizedBox(height: 10,),
          DatePickerField(
            level: 'আজকের তারিখ\ নির্বাচন করুন',
            onTap: ()=> _selectDate(context, selectedCurrentDate, "CurrentDate"),
            hintText: getFormatedDate(selectedCurrentDate),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: CustomPaint(
                  size: Size(width, (399 * 0.31473214285714285).toDouble()),
                  painter: CustomBottomPaint(),
                ),
              ),
              Positioned(
                top: 40,
                child: CustomLargeButton(
                  buttonLevel: "গণনা",
                  onPressed: (){
                    Route route = MaterialPageRoute(builder: (context)=>const ResultPage());
                    Navigator.push(context, route);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //This function used for open date picker 
  Future<void> _selectDate(BuildContext context, DateTime initialDate, String from) async {
    if(from == 'BirthDate') {
       final DateTime? pickedBirthDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );
      if (pickedBirthDate != null && pickedBirthDate != selectedBithDate) {
        setState(() {
        selectedBithDate = pickedBirthDate;
      });
      }
    } 
    if(from == "CurrentDate"){
      final DateTime? pickedCurrentDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );

      if (pickedCurrentDate != null && pickedCurrentDate != selectedCurrentDate) {
        setState(() {
        selectedCurrentDate = pickedCurrentDate;
      });
      }
    }

  }
}





