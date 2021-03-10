import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    @required this.listViewItem,
    @required this.selectedDate,
    @required this.removeItemToList,
  }) : super(key: key);

  final List<String> listViewItem;
  final DateTime selectedDate;
  final Function removeItemToList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: listViewItem.map((String value) {
          var idx = listViewItem.indexOf(
              value); // get index value, the index value can passing to remove item list parameter
          // to get specific index
          return Container(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    new BorderRadius.circular(10.0), // Custom border radius
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .stretch, // to position column text into left and right side
                    children: <Widget>[
                      Text(
                        value,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        DateFormat('EEE, MMM d').format(selectedDate),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  )),
                  IconButton(
                    icon: Icon(Icons.check_box),
                    onPressed: () {
                      removeItemToList(idx);
                    },
                  ),
                ],
              ));
        }).toList(),
      ),
    );
  }
}
