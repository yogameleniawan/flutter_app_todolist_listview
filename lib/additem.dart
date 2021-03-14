import 'package:flutter/material.dart';

import 'dropdown.dart';
import 'main.dart';

class AddItem extends StatefulWidget {
  List<String> listTitle = [];
  List<String> listDetail = [];

  AddItem({Key key, this.listTitle, this.listDetail}) : super(key: key);
  static const String routeName = "/AddList";

  @override
  _AddItemState createState() =>
      _AddItemState(listTitle: listTitle, itemDetail: listDetail);
}

class _AddItemState extends State<AddItem> {
  _AddItemState({Key key, this.listTitle, this.itemDetail});

  TextEditingController titleInput = new TextEditingController();
  TextEditingController detailInput = new TextEditingController();
  Item item = Item();
  String _value = "";
  String _detail = "";

  List<String> listTitle = [];
  List<String> itemDetail = [];
  List<String> tempTitle = [];
  List<String> tempDetail = [];
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
                controller: titleInput,
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
                    _value = titleInput.text;
                    _detail = detailInput.text;

                    if (_newValue == "High") {
                      tempTitle.insert(0, _value);
                      tempDetail.insert(0, _detail);
                      item.setList(tempTitle);
                      item.setDetail(tempDetail);

                      if ((listTitle != null) && (listTitle.length > 0)) {
                        listTitle.insert(0, _value);
                        itemDetail.insert(0, _detail);
                        item.setList(listTitle);
                        item.setDetail(itemDetail);
                      }
                    } else if (_newValue == "Low") {
                      tempTitle.add(_value);
                      tempDetail.add(_detail);
                      item.setList(tempTitle);
                      item.setDetail(tempDetail);

                      if ((listTitle != null) && (listTitle.length > 0)) {
                        listTitle.add(_value);
                        itemDetail.add(_detail);
                        item.setList(listTitle);
                        item.setDetail(itemDetail);
                      }
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MyApp(
                          listTitle: item.getList(),
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
