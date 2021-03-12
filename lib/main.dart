import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dateinfo.dart';
import 'detail.dart';
import 'dropdown.dart';
import 'input.dart';
import 'listitem.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      DetailList.routeName: (BuildContext context) => new DetailList(),
      MyApp.routeName: (BuildContext context) => new MyApp(),
    }; // Declaration route
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyApp(),
      routes: routes, //initialized routes
    );
  }
}

class Item {
  List<String> item;
  String nama;

  void setNama() {
    nama = "gasgasga";
  }

  String getNama() {
    return this.nama;
  }

  void setList(List<String> item) {
    this.item = item;
  }

  List<String> getList() {
    return this.item;
  }
}

class MyApp extends StatefulWidget {
  List<String> listData = [];
  MyApp({Key key, this.listData}) : super(key: key);
  static const String routeName = "/MyApp";

  @override
  MyAppState createState() => MyAppState(itemList: listData);
}

class MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();
  DateTime selectedDate = DateTime.now(); // get date time now

  MyAppState({Key key, this.itemList});
  Item item = Item();
  List<String> itemList = [];

  String value = "";
  var listItem = ["High", "Low"];
  String _newValue = "High";

  List<String> listViewItem = [];
  String tulis = "";

  void _addItemToList() {
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

  void _showcontent(int index) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Complete Acitivty'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text('Do you have finished your activity?'),
              ],
            ),
          ),
          actions: [
            new FlatButton(
              child: new Text('YES'),
              onPressed: () {
                Navigator.of(context).pop();
                _removeItemToList(index);
              },
            ),
            new FlatButton(
              child: new Text('NO'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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

  void navigateToDetail() {
    // DetailList(listData: item.getList(), tes: "sagasgasg");
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => DetailList(
    //       listData: item.getList(),
    //       tes: "sagasgasg",
    //     ),
    //   ),
    // );
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => new DetailList(
        listData: itemList,
        tes: "sagasgasg",
      ),
    );
    Navigator.of(context).push(route);

    // Navigator.pushNamed(context, DetailList.routeName); //push to routes
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
                      navigateToDetail, // Call function addItemToList to Add item to list
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
                      "Activity Today",
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
                      showcontent: _showcontent,
                      listViewItem: itemList,
                      selectedDate: selectedDate,
                      removeItemToList: _removeItemToList),
                ],
              ),
            ),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _textController,
            ),
          ),
          new ListTile(
            title: new RaisedButton(
              child: new Text("Next"),
              onPressed: () {
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new NextPage(value: "ggggggg"),
                );
                Navigator.of(context).push(route);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  final String value;

  NextPage({Key key, this.value}) : super(key: key);

  @override
  _NextPageState createState() => new _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Next Page"),
      ),
      body: new Text("${widget.value}"),
    );
  }
}
