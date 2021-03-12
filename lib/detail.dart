import 'package:flutter/material.dart';

import 'main.dart';

class DetailList extends StatefulWidget {
  final Function addItemToList;
  final String valueData;
  final int idxData;

  DetailList({Key key, this.addItemToList, this.valueData, this.idxData})
      : super(key: key);
  static const String routeName = "/DetailList";

  @override
  _DetailListState createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  TextEditingController etInput = new TextEditingController();
  String nama = "";
  List<String> detailValue = [];
  var resultValue = "";

  void _addToList(int idx) {
    String value = etInput.text;
    detailValue.insert(idx, value);
    var detailMap = detailValue.asMap();
    resultValue = detailMap[0];
  }

  @override
  Widget build(BuildContext context) {
    var button = new IconButton(
        icon: new Icon(Icons.arrow_back), onPressed: _onButtonPressed);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.valueData ?? ''),
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
            Container(child: Text(resultValue)),
            // Container(
            //   child: Text(widget.valueDetail ?? ''),
            // ),
            RaisedButton(
                //button 1
                onPressed: () {
                  nama = etInput.text;
                  _addToList(widget.idxData);
                },
                child: Text('Add')),
          ],
        ),
      ),
    );
  }

  void _onButtonPressed() {
    Navigator.pop(context);
  }
}
