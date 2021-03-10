import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dateinfo.dart';
import 'dropdown.dart';
import 'input.dart';
import 'listitem.dart';

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

  String value = "";
  var listItem = ["High", "Low"];
  String _newValue = "High";
  List<String> listViewItem = [];

  void addItemToList() {
    setState(() {
      value = etInput.text;
      if (_newValue == "High") {
        // insert into index 0 which is item get top position of the list
        listViewItem.insert(0, value);
      } else if (_newValue == "Low") {
        // insert into index n which is item get bottom position of the list
        listViewItem.add(value);
      } // put etInput text and assign to string value
      // input value to list item with iteration index 0 - n
      etInput.clear(); // clear value in input from when click button
    });
  }

  void _dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
    });
  }

  void _removeItemToList(int idx) {
    setState(() {
      listViewItem.removeAt(
          idx); // remove item from list with passing index value to parameter
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
                      addItemToList, // Call function addItemToList to Add item to list
                ),
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: <Widget>[
                  Input(etInput: etInput), // Input widget
                  Container(
                    // Activity Priority Text
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Activity Priority",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  DropDown(
                      // Dropdown widget
                      listItem: listItem,
                      newValue: _newValue,
                      dropdownOnChanged: _dropdownOnChanged),
                  DateInfo(selectedDate: selectedDate), // Date info widget
                  ListItem(
                      // List item widget
                      listViewItem: listViewItem,
                      selectedDate: selectedDate,
                      removeItemToList: _removeItemToList),
                ],
              ),
            ),
          ),
        ));
  }
}
