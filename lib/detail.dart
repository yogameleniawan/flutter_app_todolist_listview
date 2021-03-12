import 'package:flutter/material.dart';

import 'dropdown.dart';
import 'main.dart';

class DetailList extends StatefulWidget {
  List<String> listData = [];

  DetailList({Key key, this.listData}) : super(key: key);
  static const String routeName = "/DetailList";

  @override
  _DetailListState createState() => _DetailListState(listDataItem: listData);
}

class _DetailListState extends State<DetailList> {
  _DetailListState({Key key, this.listDataItem});

  TextEditingController etInput = new TextEditingController();
  Item item = Item();
  String _value = "";

  List<String> listDataItem = [];
  List<String> list = [];
  var listItem = ["High", "Low"];
  String _newValue = "High";

  void _dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    var button = new IconButton(
        icon: new Icon(Icons.arrow_back), onPressed: _onButtonPressed);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add Activity"),
      ),
      body: new Container(
        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: TextFormField(
                controller: etInput,
                decoration: InputDecoration(
                  labelText: "Your Activity Today",
                  hintText: "Insert your activity today",
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(new Radius.circular(10.0))),
                ),
              ),
            ),
            DropDown(
                // Dropdown widget
                listItem: listItem,
                newValue: _newValue,
                dropdownOnChanged: _dropdownOnChanged),
            Container(
              width: double.infinity,
              child: RaisedButton(
                  //button 1
                  onPressed: () {
                    _value = etInput.text;
                    item.getList();

                    if (_newValue == "High") {
                      list.insert(0, _value);
                      item.setList(list);

                      if ((listDataItem != null) && (listDataItem.length > 0)) {
                        listDataItem.insert(0, _value);
                        item.setList(listDataItem);
                      }
                    } else if (_newValue == "Low") {
                      list.add(_value);
                      item.setList(list);

                      if ((listDataItem != null) && (listDataItem.length > 0)) {
                        listDataItem.add(_value);
                        item.setList(listDataItem);
                      }
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MyApp(
                          listData: item.getList(),
                        ),
                      ),
                    );
                  },
                  child: Text('Add')),
            ),
          ],
        ),
      ),
    );
  }

  void _onButtonPressed() {
    Navigator.pop(context);
  }
}
