import 'package:flutter/material.dart';

import 'main.dart';

class DetailList extends StatefulWidget {
  List<String> listData = [];
  String tes = "";
  DetailList({Key key, this.listData, this.tes}) : super(key: key);
  static const String routeName = "/DetailList";

  @override
  _DetailListState createState() => _DetailListState(listDataItem: listData);
}

class _DetailListState extends State<DetailList> {
  _DetailListState({Key key, this.listDataItem});

  TextEditingController etInput = new TextEditingController();
  String nama = "";
  Item item = Item();

  List<String> listDataItem = [];
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    var button = new IconButton(
        icon: new Icon(Icons.arrow_back), onPressed: _onButtonPressed);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("teess"),
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
            RaisedButton(
                //button 1
                onPressed: () {
                  nama = etInput.text;
                  item.getList();
                  list.add(nama);
                  item.setList(list);

                  if ((listDataItem != null) && (listDataItem.length > 0)) {
                    listDataItem.add(nama);
                    item.setList(listDataItem);
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
          ],
        ),
      ),
    );
  }

  void _onButtonPressed() {
    Navigator.pop(context);
  }
}
