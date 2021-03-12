import 'package:flutter/material.dart';

import 'main.dart';

class Info extends StatefulWidget {
  final Function addItemToList;
  final String valueDetail;

  Info({Key key, this.addItemToList, this.valueDetail}) : super(key: key);
  static const String routeName = "/DetailList";

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  TextEditingController etInput = new TextEditingController();
  String nama = "";
  @override
  Widget build(BuildContext context) {
    var button = new IconButton(
        icon: new Icon(Icons.arrow_back), onPressed: _onButtonPressed);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.valueDetail ?? ''),
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
            // Container(
            //   child: Text(widget.valueDetail ?? ''),
            // ),
            RaisedButton(
                //button 1
                onPressed: () {
                  nama = etInput.text;
                  widget.addItemToList;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MyApp(),
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
