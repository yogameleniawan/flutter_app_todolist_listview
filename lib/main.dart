import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dateinfo.dart';
import 'additem.dart';
import 'info.dart';
import 'listitem.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      AddItem.routeName: (BuildContext context) => new AddItem(),
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
  List<String> detail;

  void setList(List<String> item) {
    this.item = item;
  }

  void setDetail(List<String> detail) {
    this.detail = detail;
  }

  List<String> getList() {
    return this.item;
  }

  List<String> getDetail() {
    return this.detail;
  }
}

class MyApp extends StatefulWidget {
  List<String> listTitle = [];
  List<String> listDetail = [];
  MyApp({Key key, this.listTitle, this.listDetail}) : super(key: key);
  static const String routeName = "/MyApp";

  @override
  MyAppState createState() =>
      MyAppState(listTitle: listTitle, itemDetail: listDetail);
}

class MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();
  DateTime selectedDate = DateTime.now(); // get date time now

  MyAppState(
      {Key key,
      this.listTitle,
      this.itemDetail}); // retreive list from parameter
  List<String> listTitle = [];
  List<String> itemDetail = [];

  String value = "";
  var listItem = ["High", "Low"];
  String _newValue = "High";

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
      listTitle.removeAt(
          idx); // remove item from list with passing index value to parameter
      itemDetail.removeAt(idx);
    });
  }

  void _navigateToAdd() {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => new AddItem(
        listTitle: listTitle,
        listDetail: itemDetail,
      ),
    );
    Navigator.of(context).push(route);
    // Navigator.pushNamed(context, DetailList.routeName); //push to routes
  }

  void _navigateToDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Info(),
      ),
    );
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
                      _navigateToAdd, // Call function addItemToList to Add item to list
                ),
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: <Widget>[
                  DateInfo(selectedDate: selectedDate), // Date info widget
                  ListItem(
                      // List item widget
                      navigateToDetail: _navigateToDetail,
                      showcontent: _showcontent,
                      listTitle: listTitle,
                      listDetail: itemDetail,
                      selectedDate: selectedDate,
                      removeItemToList: _removeItemToList),
                ],
              ),
            ),
          ),
        ));
  }
}
