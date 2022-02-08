import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jisan/screens/landing_screen.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Calculator();
  }
}
String input = "", value = '', resultFinal = '';
double? dresult;

int? value1, value2, result, pressequal = 0, presskey = 0, operator = 0, activity=0;

class _Calculator extends State<Calculator> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ক্যালকুলেটর',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.indigoAccent,
          )),
      home: const MyHomePage(title: 'ক্যালকুলেটর'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      input,
                      style: const TextStyle(fontSize: 35),
                    ),
                    Text(
                      resultFinal,
                      style: const TextStyle(fontSize: 35),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if (pressequal == 1 && value2 != null) {
                          input = '';
                          value = '';
                          operator = 0;
                          pressequal = 0;
                          presskey = 0;
                          resultFinal = '';
                          value2 = null;
                        }
                        presskey = 1;
                        input = input + '1';
                        value = value + '1';
                      });
                    },
                    child: Container(
                      child: const Text(
                        "1",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if (pressequal == 1 && value2 != null) {
                          input = '';
                          value = '';
                          operator = 0;
                          pressequal = 0;
                          presskey = 0;
                          resultFinal = '';
                          value2 = null;
                        }
                        presskey = 1;
                        input = input + '2';
                        value = value + '2';
                      });
                    },
                    child: Container(
                      child: const Text(
                        "2",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if (pressequal == 1 && value2 != null) {
                          input = '';
                          value = '';
                          operator = 0;
                          pressequal = 0;
                          presskey = 0;
                          resultFinal = '';
                          value2 = null;
                        }
                        presskey = 1;
                        input = input + '3';
                        value = value + '3';
                      });
                    },
                    child: Container(
                      child: const Text(
                        "3",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        activity=1;
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if (pressequal == 1 && value2 != null) {
                          input = '';
                          value = '';
                          operator = 0;
                          pressequal = 0;
                          presskey = 0;
                          resultFinal = '';
                          value2 = null;
                        }

                        if (presskey == 1 && operator == 0) {
                          input = input + '+';
                          value1 = int.parse(value);
                          value = '';
                        }
                      });
                    },
                    child: Container(
                      child: const Text(
                        "+",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if (pressequal == 1 && value2 != null) {
                          input = '';
                          value = '';
                          operator = 0;
                          pressequal = 0;
                          presskey = 0;
                          resultFinal = '';
                          value2 = null;
                        }
                        presskey = 1;
                        input = input + '4';
                        value = value + '4';
                      });
                    },
                    child: Container(
                      child: const Text(
                        "4",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if (pressequal == 1 && value2 != null) {
                          input = '';
                          value = '';
                          operator = 0;
                          pressequal = 0;
                          presskey = 0;
                          resultFinal = '';
                          value2 = null;
                        }
                        presskey = 1;
                        input = input + '5';
                        value = value + '5';
                      });
                    },
                    child: Container(
                      child: const Text(
                        "5",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if (pressequal == 1 && value2 != null) {
                          input = '';
                          value = '';
                          operator = 0;
                          pressequal = 0;
                          presskey = 0;
                          resultFinal = '';
                          value2 = null;
                        }
                        presskey = 1;
                        input = input + '6';
                        value = value + '6';
                      });
                    },
                    child: Container(
                      child: const Text(
                        "6",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        activity=2;
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if (pressequal == 1 && value2 != null) {
                          input = '';
                          value = '';
                          operator = 0;
                          pressequal = 0;
                          presskey = 0;
                          resultFinal = '';
                          value2 = null;
                        }

                        if (presskey == 1 && operator == 0) {
                          input = input + '-';
                          value1 = int.parse(value);
                          value = '';
                        }
                      });
                    },
                    child: Container(
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 25,
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if (pressequal == 1 && value2 != null) {
                          input = '';
                          value = '';
                          operator = 0;
                          pressequal = 0;
                          presskey = 0;
                          resultFinal = '';
                          value2 = null;
                        }
                        presskey = 1;
                        input = input + '7';
                        value = value + '7';
                      });
                    },
                    child: Container(
                      child: const Text(
                        "7",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if (pressequal == 1 && value2 != null) {
                          input = '';
                          value = '';
                          operator = 0;
                          pressequal = 0;
                          presskey = 0;
                          resultFinal = '';
                          value2 = null;
                        }
                        presskey = 1;
                        input = input + '8';
                        value = value + '8';
                      });
                    },
                    child: Container(
                      child: const Text(
                        "8",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if (pressequal == 1 && value2 != null) {
                          input = '';
                          value = '';
                          operator = 0;
                          pressequal = 0;
                          presskey = 0;
                          resultFinal = '';
                          value2 = null;
                        }
                        presskey = 1;
                        input = input + '9';
                        value = value + '9';
                      });
                    },
                    child: Container(
                      child: const Text(
                        "9",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        activity=3;
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if (pressequal == 1 && value2 != null) {
                          input = '';
                          value = '';
                          operator = 0;
                          pressequal = 0;
                          presskey = 0;
                          resultFinal = '';
                          value2 = null;
                        }

                        if (presskey == 1 && operator == 0) {
                          input = input + 'X';
                          value1 = int.parse(value);
                          value = '';
                        }
                      });
                    },
                    child: Container(
                      child: const Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: 25,
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if (pressequal == 1 && value2 != null) {
                          input = '';
                          value = '';
                          operator = 0;
                          pressequal = 0;
                          presskey = 0;
                          resultFinal = '';
                          value2 = null;
                        }
                        presskey = 1;
                        input = input + '0';
                        value = value + '0';
                      });
                    },
                    child: Container(
                      child: const Text(
                        "0",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {

                        input = '';
                        value = '';
                        operator = 0;
                        pressequal = 0;
                        presskey = 0;
                        resultFinal = '';
                        value2 = null;

                      });
                    },
                    child: Container(
                      child: const Text(
                        "C",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        pressequal = 1;
                        value2 = int.parse(value);
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if(activity==1){
                          result = (value1! + value2!);
                          resultFinal = '=' + result.toString();
                        }
                        if(activity==2){
                          result = (value1! - value2!);
                          resultFinal = '=' + result.toString();
                        }
                        if(activity==3){
                          result = (value1! * value2!);
                          resultFinal = '=' + result.toString();
                        }
                        if(activity==4){
                          if(value2==0){
                            resultFinal='=Infinity';
                          }
                          if(value2!=0){
                            dresult = (value1! / value2!);
                            resultFinal = '=' + dresult.toString();
                          }
                        }
                      });
                    },
                    child: Container(
                      child: const Text(
                        "=",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        activity=4;
                        if(input.length==20){
                          input='';
                          operator=0;
                          resultFinal='';
                          value2=null;
                          value1=null;
                          value='';
                          presskey=0;
                          pressequal=0;
                        }
                        if (pressequal == 1 && value2 != null) {
                          input = '';
                          value = '';
                          operator = 0;
                          pressequal = 0;
                          presskey = 0;
                          resultFinal = '';
                          value2 = null;
                        }

                        if (presskey == 1 && operator == 0) {
                          input = input + '/';
                          value1 = int.parse(value);
                          value = '';
                        }
                      });
                    },
                    child: Container(
                      child: const Text(
                        "/",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.indigoAccent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}