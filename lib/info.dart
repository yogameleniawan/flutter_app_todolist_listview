import 'package:flutter/material.dart';

import 'main.dart';

class Info extends StatefulWidget {
  final Function addItemToList;
  final String valueDetail;
  final int index;
  List<String> detailList = [];

  Info(
      {Key key,
      this.addItemToList,
      this.valueDetail,
      this.index,
      this.detailList})
      : super(key: key);
  static const String routeName = "/DetailList";

  @override
  _InfoState createState() => _InfoState(listDetail: detailList);
}

class _InfoState extends State<Info> {
  _InfoState({Key key, this.listDetail});
  List<String> listDetail = [];

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
            Container(child: Text(widget.valueDetail)),
            Container(child: Text(listDetail[widget.index])),
          ],
        ),
      ),
    );
  }

  void _onButtonPressed() {
    Navigator.pop(context);
  }
}
