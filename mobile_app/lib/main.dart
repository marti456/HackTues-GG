import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_tues__gg/w_container.dart';
import 'package:http/http.dart' as http; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hack Tues GG',
      home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  List<WasteContainer> acontainers = new List<WasteContainer>();

  Future<List<WasteContainer>> fetchNotes() async{
    var url = 'http://192.168.1.12/flutterResponse.php';/////to type the link
    var response = await http.get(url);
    print(response);
    var containers = List<WasteContainer>();


    if(response.statusCode == 200){
      var wasteContainersJson = json.decode(response.body);
      for(var contJson in wasteContainersJson){
        containers.add(contJson);
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      
    });
    fetchNotes().then((value){
      setState(() {
        acontainers.addAll(value);
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Waste Managment'),
        backgroundColor: Colors.blue,
        ),
        
      body: ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                    Text(
                      "Location:",
                      style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Text(
                      acontainers[index].location,
                      style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                ],),
            )
          );
        },
        itemCount: acontainers.length,
      )
    );
  }
}