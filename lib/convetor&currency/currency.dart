import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var selected='USD';
var toselected='BD';
var controller=TextEditingController();
var resultplace=TextEditingController();
var items = [
  'BD',
  'EGP',
  'IDR',
  'JPY',
  'LKR',
  'NPR',
  'NZD',
  'PKR',
  'RUB',
  'SGD',
  'USD'
];

class currency extends StatefulWidget {
  const currency({ Key? key }) : super(key: key);

  @override
  _currency createState() => _currency();
}


class _currency extends State<currency> {
  String getlabel(String? code) {
    if (code == 'EGP') {
      return ('Egyptian Pound');
    }
    if (code == 'IDR') {
      return ('Rupiah');
    }
    if (code == 'BD') {
      return ('Bangladesh Taka');
    }
    if (code == 'JPY') {
      return ('Yen');
    }
    if (code == 'LKR') {
      return ('Sri Lanka Rupee');
    }
    if (code == 'NPR') {
      return ('Nepalese Rupee');
    }
    if (code == 'NZD') {
      return ('New Zeland Dollar');
    }
    if (code == 'PKR') {
      return ('Pakistan Rupee');
    }
    if (code == 'RUB') {
      return ('Russian Ruble');
    }
    if (code == 'SGD') {
      return ('Singapore Dollar');
    }
    if (code == 'USD') {
      return ('US Dollar');
    }
    return ('Unknown currency');
  }

  @override
  Widget build(BuildContext context) {
    initState(){
      controller.text='1';
      selected='USD';
      toselected='BD';
    }

    Future<String> resData() async {
      final apiUrl = Uri.parse(
          "https://free.currconv.com/api/v7/convert?q=${selected}_${toselected}&compact=ultra&apiKey=299f4bbe14836ad9daee");
      //https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=835223&date=03062021
      print("Pining");
      var response = await http.get(apiUrl);
      await http.get(apiUrl);
      var jsonresp = jsonDecode(response.body);
      print(jsonresp.toString());
      var returnData = jsonresp.toString();
      return jsonresp['${selected}_${toselected}'].toString();
    }

    return MaterialApp(
      title: 'মুদ্রা রূপান্তরকারী',
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromRGBO(20, 193, 185, 1.0)),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(20, 193, 185, 1.0),
          title: const Text('মুদ্রা রূপান্তরকারী'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    decoration:
                    const BoxDecoration(color: Color.fromRGBO(18, 20, 27, 1)),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DropdownButton(
                            dropdownColor: const Color.fromRGBO(18, 20, 27, 1),
                            style: const TextStyle(color:Colors.white),
                            value: selected,
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                  value: items, child:
                              Text(items));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selected = newValue.toString();
                              });
                            }),
                        Text(getlabel(selected), style: const TextStyle(color:Colors.white54),),
                        const SizedBox(height:20),
                        Row(children: [
                          const Text('\$', style: TextStyle(color:Colors.white54, fontSize: 28)),
                          const SizedBox(width:10),
                          Expanded(child: TextField(
                              style : const TextStyle(color: Colors.white, fontSize: 20,),
                              keyboardType: TextInputType.number,
                              controller: controller)),

                        ],

                        ),
                        const SizedBox(height:20)
                      ],


                    )),
                const SizedBox(height:20),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        var result = await resData().then((String result){
                          print(result.toString()
                          );
                          var rint=double.parse(result);
                          var entnum=double.parse(controller.text);
                          rint=rint*entnum;
                          var rint2=num.parse(rint.toStringAsFixed(2)).toString();
                          setState(() {
                            resultplace.text=rint2;
                          });
                        });

                      },

                      child: Container(
                        margin: const EdgeInsets.only(left:30,),
                        color:const Color.fromRGBO(39, 47, 81, 1.0),
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                        child: const Text('=', style: TextStyle(color:Colors.white54, fontSize: 28)),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height:20),
                Container(
                    decoration:
                    const BoxDecoration(color: Color.fromRGBO(18, 20, 27, 1)),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DropdownButton(
                            dropdownColor: const Color.fromRGBO(18, 20, 27, 1),
                            style: const TextStyle(color:Colors.white),
                            value: toselected,
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                  value: items, child:
                              Text(items));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                toselected = newValue.toString();
                              });
                            }),
                        Text(getlabel(toselected), style: const TextStyle(color:Colors.white54),),
                        const SizedBox(height:20),
                        Row(children: [
                          const Text('\৳', style: TextStyle(color:Colors.white54, fontSize: 28)),
                          const SizedBox(width:10),
                          Expanded(child: TextField(
                              style : const TextStyle(color: Colors.white, fontSize: 20,),
                              enabled: false,
                              controller: resultplace)),

                        ],

                        ),
                        const SizedBox(height:20)
                      ],


                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
