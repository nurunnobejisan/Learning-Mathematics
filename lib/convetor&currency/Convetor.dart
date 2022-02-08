import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/landing_screen.dart';



class convector extends StatefulWidget {

  @override
  _convector createState() => _convector();
}

class _convector extends State<convector> {
  final myController = TextEditingController();

  double kelvin = 0;
  double reamur = 0;

  void hitung(double value) {
    setState(() {
      kelvin = value + 273.15;
      reamur = (4 / 5) * value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(

          title: const Text("তাপমাত্রা রূপান্তরকারী"),
          backgroundColor: Colors.indigoAccent,

        ),
        body: Column(
          children: <Widget>[
            Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const LandingScreen(),
                        ));
                  },),
                Container(
                  child: Input(myController: myController),

                  padding: const EdgeInsets.all(12.0),


                ),
              ],
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 200.0),
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: const Text("কেলভিন্সের তাপমাত্রা",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54)),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: Text("$kelvin" + " K",
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.black)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 200.0),
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: const Text("Reamur তাপমাত্রা",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54)),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: Text("$reamur" + " R",
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.black)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(children: <Widget>[
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () => hitung(double.parse(myController.text)),
                      child: const Text('এখন রূপান্তর করুন!',
                          style: TextStyle(fontSize: 20)),
                      color: Colors.indigoAccent,
                      textColor: Colors.white,
                      elevation: 5,
                    ),
                  )),
            ]),
          ],
        ),
      ),
    );
    return materialApp;
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.myController,
  }) : super(key: key);

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      decoration:
      const InputDecoration(labelText: 'সেন্টিগ্রেডে তাপমাত্রা সন্নিবেশ করান',hintStyle: TextStyle(
        decoration:
        TextDecoration.underline,
        color: Color(0xff0446dd),
        fontSize: 25,
      ),),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}