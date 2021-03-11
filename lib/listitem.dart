import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    @required this.listViewItem,
    @required this.showcontent,
    @required this.selectedDate,
    @required this.removeItemToList,
  }) : super(key: key);

  final List<String> listViewItem;
  final DateTime selectedDate;
  final Function removeItemToList;
  final Function showcontent;

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
                        // format EEE which mean 3 character of the day (Sunday -> Sun, Monday -> Mon ...)
                        // MMM which mean 3 character of the month (January -> Jan, February -> Feb ...)
                        // d is date (1 - 31)
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
                      showcontent(
                          idx); // call showAlertDialog and passing 2 parameter context and idx
                      // idx is value of the index of the list when the button on pressed,
                      // if button press on first list, so the value idx is [0]
                      // if button press on second list, so the value idx is [1]
                      // etc..
                      // so we can remove item from list by the value of idx
                      // which mean we can choose the item from the list and then we can remove the item
                    },
                  ),
                ],
              ));
        }).toList(),
      ),
    );
  }
}
