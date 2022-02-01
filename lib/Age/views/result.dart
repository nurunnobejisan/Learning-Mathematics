

import 'package:jisan/Age/constant/color.dart';
import 'package:jisan/Age/controller/age_calculator.dart';
import 'package:jisan/Age/global/helper_function.dart';
import 'package:jisan/Age/global/utils.dart';
import 'package:jisan/Age/widget/app_name.dart';
import 'package:jisan/Age/widget/custom_bottom_paint.dart';
import 'package:jisan/Age/widget/custom_divider.dart';
import 'package:jisan/Age/widget/custom_large_button.dart';
import 'package:jisan/Age/widget/custom_list_tile.dart';
import 'package:jisan/Age/widget/custom_top_paint.dart';
import 'package:jisan/Age/widget/summary_card_builder.dart';
import 'package:flutter/material.dart';


class ResultPage extends StatefulWidget {
  const ResultPage({ Key? key }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

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
                size: Size(width, (350*0.31473214285714285).toDouble()),
                painter: CustomTopPaint(),
              ),
              const Positioned(
                top: 30,
                child: AppName(),
              )
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomListTile(
                  leading: "জন্মতারিখ",
                  trailing: getFormatedDate(selectedBithDate),
                ),
                const SizedBox(height: 20,),
                CustomListTile(
                  leading: "আজকের",
                  trailing: getFormatedDate(selectedCurrentDate),
                ),
              ],
            )
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(15),
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xff90dce2),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("বয়স"),
                      Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: AgeCalculator.age(selectedBithDate, today: selectedCurrentDate).years.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                          const TextSpan(
                            text: ' বছর',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                       ),
                      ),
                      Text("${AgeCalculator.age(selectedBithDate, today: selectedCurrentDate).months.toString()} Months | ${AgeCalculator.age(selectedBithDate, today: selectedCurrentDate).days.toString()} Days"),
                    ],
                  ),
                ),
                const CustomDivider(),
                Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const Text("পরবর্তী জন্মদিন"),
                     Text(AgeCalculator.findDayName().toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                     Text("${AgeCalculator.timeToNextBirthday(selectedBithDate, fromDate: selectedCurrentDate).months} Months | ${AgeCalculator.timeToNextBirthday(selectedBithDate, fromDate: selectedCurrentDate).days} Days"),
                   ],
                 ),
               )
              ],
            )
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xff90dce2),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                Text("বয়স মধ্যে", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w700),),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SummaryCardBuilder(
                          title: "বছর",
                          subTitle: AgeCalculator.age(selectedBithDate, today: selectedCurrentDate).years.toString(),
                        ),
                        const SizedBox(height: 20,),
                        SummaryCardBuilder(
                          title: "সপ্তাহ",
                          subTitle: (AgeCalculator.age(selectedBithDate, today: selectedCurrentDate).years * 52).toString(),
                          fontSize: 14,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SummaryCardBuilder(
                          title: "মাস",
                          subTitle: (AgeCalculator.age(selectedBithDate, today: selectedCurrentDate).years * 12).toString(),
                        ),
                        const SizedBox(height: 20,),
                        SummaryCardBuilder(
                          title: "ঘন্টার",
                          subTitle: AgeCalculator.hoursBetween(selectedBithDate, selectedCurrentDate).toString(),
                          fontSize: 14,
                        ),
                      ],
                    ),
                     Column(
                       children: [
                         SummaryCardBuilder(
                           title: "দিন",
                           subTitle: AgeCalculator.daysBetween(selectedBithDate, selectedCurrentDate).toString(),
                         ),
                         const SizedBox(height: 20,),
                         SummaryCardBuilder(
                           title: "মিনিট",
                           subTitle: AgeCalculator.minutesBetween(selectedBithDate, selectedCurrentDate).toString(),
                           fontSize: 14,
                         ),
                       ],
                     )
                  ],
                )
              ],
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: CustomPaint(
                  size: Size(width, (399*0.31473214285714285).toDouble()),
                  painter: CustomBottomPaint(),
                ),
              ),
              Positioned(
                top: 40,
                child: CustomLargeButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  buttonLevel: "পুনরায় গণনা করুন",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}







