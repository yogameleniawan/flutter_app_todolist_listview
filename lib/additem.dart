import 'package:flutter/material.dart';

import 'dropdown.dart';
import 'main.dart';

class AddItem extends StatefulWidget {
  List<String> listData = [];
  List<String> listDetail = [];

  AddItem({Key key, this.listData, this.listDetail}) : super(key: key);
  static const String routeName = "/DetailList";

  @override
  _AddItemState createState() =>
      _AddItemState(listDataItem: listData, itemDetail: listDetail);
}

class _AddItemState extends State<AddItem> {
  _AddItemState({Key key, this.listDataItem, this.itemDetail});

  TextEditingController etInput = new TextEditingController();
  TextEditingController detailInput = new TextEditingController();
  Item item = Item();
  String _value = "";
  String _detail = "";

  List<String> listDataItem = [];
  List<String> itemDetail = [];
  List<String> list = [];
  List<String> listDetail = [];
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
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                controller: detailInput,
                decoration: InputDecoration(
                  labelText: "Detail Activity",
                  hintText: "Insert your detail activity",
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(new Radius.circular(10.0))),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text("Activity Priority"),
            ),
            DropDown(
                // Dropdown widget
                listItem: listItem,
                newValue: _newValue,
                dropdownOnChanged: _dropdownOnChanged),
            Container(
              width: double.infinity,
              child: RaisedButton(
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  //button 1
                  onPressed: () {
                    _value = etInput.text;
                    _detail = detailInput.text;

                    if (_newValue == "High") {
                      list.insert(0, _value);
                      listDetail.insert(0, _detail);
                      item.setList(list);
                      item.setDetail(listDetail);

                      if ((listDataItem != null) && (listDataItem.length > 0)) {
                        listDataItem.insert(0, _value);
                        itemDetail.insert(0, _detail);
                        item.setList(listDataItem);
                        item.setDetail(itemDetail);
                      }
                    } else if (_newValue == "Low") {
                      list.add(_value);
                      listDetail.add(_detail);
                      item.setList(list);
                      item.setDetail(listDetail);

                      if ((listDataItem != null) && (listDataItem.length > 0)) {
                        listDataItem.add(_value);
                        itemDetail.add(_detail);
                        item.setList(listDataItem);
                        item.setDetail(itemDetail);
                      }
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MyApp(
                          listData: item.getList(),
                          listDetail: item.getDetail(),
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
