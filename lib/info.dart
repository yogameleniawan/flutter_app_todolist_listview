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
        title: new Text("Detail Activity"),
      ),
      body: Card(
          margin: EdgeInsets.only(top: 10),
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: InkWell(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .stretch, // to position column text into left and right side
                    children: <Widget>[
                      Text(
                        widget.valueDetail,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        listDetail[widget.index],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          )),
    );
  }

  void _onButtonPressed() {
    Navigator.pop(context);
  }
}
