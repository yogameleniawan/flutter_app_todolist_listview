import 'package:flutter/material.dart';

import 'main.dart';

class Info extends StatefulWidget {
  final int index;
  List<String> listDetail = [];
  List<String> listTitle = [];

  Info({
    Key key,
    this.index,
    this.listDetail,
    this.listTitle,
  }) : super(key: key);
  static const String routeName = "/DetailList";

  @override
  _InfoState createState() =>
      _InfoState(listDetail: listDetail, listTitle: listTitle);
}

class _InfoState extends State<Info> {
  _InfoState({Key key, this.listDetail, this.listTitle});
  TextEditingController titleInput = new TextEditingController();
  TextEditingController detailInput = new TextEditingController();
  List<String> listTitle = [];
  List<String> listDetail = [];
  List<String> tempTitle = [];
  List<String> tempDetail = [];
  String _value = "";
  String _detail = "";
  Item item = Item();

  @override
  void initState() {
    super.initState();
    titleInput.text = listTitle[widget.index];
    detailInput.text = listDetail[widget.index];
  }

  @override
  Widget build(BuildContext context) {
    var button = new IconButton(
        icon: new Icon(Icons.arrow_back), onPressed: _onButtonPressed);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Detail Activity"),
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
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(new Radius.circular(10.0))),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    var varTitle = titleInput.text;
                    var varDetail = detailInput.text;
                    if (varTitle == "" && varDetail == "") {
                      _value = listTitle[widget.index];
                      _detail = listDetail[widget.index];
                    } else if (varTitle == "" && varDetail != "") {
                      _value = listTitle[widget.index];
                      _detail = detailInput.text;
                    } else if (varTitle != "" && varDetail == "") {
                      _value = titleInput.text;
                      _detail = listDetail[widget.index];
                    } else if (varTitle != "" && varDetail != "") {
                      _value = titleInput.text;
                      _detail = detailInput.text;
                    }

                    tempTitle = listTitle;
                    tempDetail = listDetail;
                    tempTitle.removeAt(widget.index);
                    tempTitle.insert(widget.index, _value);
                    tempDetail.removeAt(widget.index);
                    tempDetail.insert(widget.index, _detail);
                    item.setList(tempTitle);
                    item.setDetail(tempDetail);

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
                  child: Text('Update')),
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
