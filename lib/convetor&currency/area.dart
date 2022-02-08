
import 'package:flutter/material.dart';
import 'package:jisan/screens/landing_screen.dart';



class Home2 extends StatelessWidget {
  // const Home2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('এলাকার ক্ষমতা গণনা করুন'),
          backgroundColor: Colors.indigoAccent,
        ),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  // const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var ctl_width = TextEditingController();
  var ctl_height = TextEditingController();
  var ctl_length = TextEditingController();
  var result = TextEditingController();

  @override
  void initState() {

    super.initState();
    result.text = 'ফলাফল এখানে উপস্থিত হবে';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
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
          Image.asset(
            'assets/images/area.png',
            width: 100,
            height: 150,
          ),
          const Center(
              child: Text(
                'ইনপুট ডাটা',
                style: TextStyle(fontSize: 20),
              )),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextField(
              controller: ctl_width,
              decoration: const InputDecoration(
                  labelText: 'প্রস্থ (m.)', border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextField(
              controller: ctl_length,
              decoration: const InputDecoration(
                  labelText: 'দৈর্ঘ্য (m.)', border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextField(
              controller: ctl_height,
              decoration: const InputDecoration(
                  labelText: 'উচ্চতা (m.)', border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                print(ctl_width.text);
                print(ctl_length.text);
                print(ctl_height.text);
                setState(() {
                  var v1 = double.parse(ctl_width.text);
                  var v2 = double.parse(ctl_length.text);
                  var v3 = double.parse(ctl_height.text);
                  var calc = v1 * v2 * v3;
                  print('Result: $calc (cubic metre)');
                  result.text =
                  " এলাকার আকার $v1 x $v2 x $v3\nমোট ক্যাপাসিটি: $calc ঘনমিটার";
                });
              },
              child: const Text(
                'গণনা',
                style: TextStyle(fontSize: 20),
              )),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              children: [
                Text(
                  result.text,
                  style: const TextStyle(fontSize: 16, color: Colors.indigoAccent),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}