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

  String value = "";
  var listItem = ["High", "Low"];
  String _newValue = "High";
  List<String> listViewItem = [];

  void addItemToList() {
    setState(() {
      value = etInput.text;
      if (_newValue == "High") {
        listViewItem.insert(0, value);
      } else if (_newValue == "Low") {
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
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // alignment start
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
                  Expanded(
                    child: ListView(
                      children: listViewItem.map((String value) {
                        return Container(
                            padding:
                                EdgeInsets.only(left: 10, top: 10, bottom: 10),
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(
                                  10.0), // Custom border radius
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .stretch, // to position column text into left and right side
                                  children: <Widget>[
                                    Text(
                                      value,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Text(
                                      DateFormat('EEE, MMM d')
                                          .format(selectedDate),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                )),
                                IconButton(
                                  icon: Icon(Icons.check_box),
                                  onPressed: () {},
                                ),
                              ],
                            ));
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
