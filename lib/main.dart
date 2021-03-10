import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();
  DateTime selectedDate = DateTime.now(); // get date time now

  var listItem = ["High", "Low"];
  String _newValue = "High";

  void _dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
    });
  }

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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(
                          10.0), // to custom border radius
                    ),
                    child: Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 2),
                        child: TextFormField(
                            controller: etInput,
                            decoration: InputDecoration(
                              hintText: "Insert your activity today",
                              border: InputBorder.none,
                            ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Activity Priority",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // to custom border radius
                    ),
                    child: DropdownButton<String>(
                      items: listItem.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _newValue,
                      onChanged: _dropdownOnChanged,
                    ),
                  ),
                  Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "My Day",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            DateFormat('EEEEEE, MMMM d').format(
                                selectedDate), // get date format with EEEEEE (Full character of Day -> Sunday, Monday, Tuesday)
                            // EEE (Just 3 character of day name -> Sun, Mon, Tue)
                            // MMMM (Full character of Month -> January, February, March)
                            // MM (Just 3 character of month name -> Jan, Feb, Mar)
                            // d show the date (1 - 31)
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
