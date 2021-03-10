import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'To Do List',
        home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "lib/images/background.jpg"), //Image Asset Background Image
                  fit: BoxFit.cover)), // fit image to cover background
          child: Scaffold(
            backgroundColor:
                Colors.transparent, // Transparent Color Background Scaffold
            appBar: AppBar(
              centerTitle: true, // change title position to center
              elevation:
                  0, // This controls the size of the shadow below the material and the opacity
              backgroundColor:
                  Colors.transparent, // Transparent Color Background App Bar
              title: Text("To Do List"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add_box),
                  onPressed:
                      () {}, // Call function addItemToList to Add item to list
                ),
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "To Do List",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ), //Show List Item
                ],
              ),
            ),
          ),
        ));
  }
}
