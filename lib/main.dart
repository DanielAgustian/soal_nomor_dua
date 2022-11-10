import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soal Nomor Dua',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final etController = TextEditingController();
  String errText = '';
  String resultText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          TextField(
            controller: etController,
          ),
          ElevatedButton(
              onPressed: () {
                checkData();
              },
              child: Text('Check!')),
          Text(
            resultText,
            style: TextStyle(color: Colors.blue.shade900),
          ),
          Text(
            errText,
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void checkData() {
    String data = etController.text;
    var arr = data.trim().split(' ');
    setState(() {
      errText = '';
      resultText = '';
    });
    if (arr.length != 4) {
      setState(() {
        errText = 'Input Invalid';
      });
      return;
    }
    int posKG1 = int.parse(arr[0]);
    int kaliKG1 = int.parse(arr[1]);
    int posKG2 = int.parse(arr[2]);
    int kaliKG2 = int.parse(arr[3]);

    if (posKG1 < posKG2 && kaliKG1 <= kaliKG2) {
      setState(() {
        errText = 'Tidak Bertemu';
      });
      return;
    }
    if (posKG1 > posKG2 && kaliKG1 >= kaliKG2) {
      setState(() {
        errText = 'Tidak Bertemu';
      });
      return;
    }
    if (posKG1 == posKG2) {
      setState(() {
        resultText = 'Bertemu di $posKG1';
      });
    }
    int currPos1 = posKG1;
    int currPos2 = posKG2;
    while (currPos1 != currPos2) {
      currPos1 += kaliKG1;
      currPos2 += kaliKG2;
      print('------POS---');
      print(currPos1);
      print(currPos2);
    }
    setState(() {
      resultText = 'Bertemu di $currPos1';
    });
  }
}
