import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Time Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: "TTicket"),
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
  String _timeString = "";
  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text(_timeString,
                    style: const TextStyle(
                        fontSize: 40,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold)),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPopupDialog(context),
                      );
                    },
                    child: const Text("Edit"))
              ])
            ],
          ),
        )
        //Center(
        //  child: Text(_timeString,style:const TextStyle(fontSize: 40,color: Colors.teal,fontWeight:FontWeight.bold)),
        //),
        );
  }

  Widget _buildPopupDialog(BuildContext context) {
    final options = <String>[
      'Hallo',
      'Megaman',
      'Metal Gear',
      'Super Smash',
      'Final Fantasy'
    ];

    return AlertDialog(
      title: const Text('Popup example'),

      content:
      // ListView(
      //  children: [
      //    ...options.map((e) => Text(e)),
      //  ], 
      // ),
       Column(
         mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           //const Text("Hallo"),
           ...options.map((game) => Text(game))
         ],
       ),
      actions: <Widget>[
        ElevatedButton(
            onPressed: (() => Navigator.of(context).pop()),
            child: const Text("Close", style: TextStyle(color: Colors.white))),
      ],
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    //return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
    return DateFormat('hh:mm:ss').format(dateTime);
  }
}
