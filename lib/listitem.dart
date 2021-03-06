import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'info.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    this.listTitle,
    this.listDetail,
    this.navigateToDetail,
    this.showcontent,
    this.selectedDate,
    this.removeItemToList,
  }) : super(key: key);

  final List<String> listTitle;
  final List<String> listDetail;
  final DateTime selectedDate;
  final Function removeItemToList;
  final Function navigateToDetail;
  final Function showcontent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: listTitle?.map((String value) {
              var idx = listTitle.indexOf(
                  value); // get index value, the index value can passing to remove item list parameter
              // to get specific index

              return GestureDetector(
                child: Card(
                    margin: EdgeInsets.only(top: 10),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: InkWell(
                        onLongPress: () {
                          showcontent(idx);
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Info(
                                listDetail: listDetail,
                                listTitle: listTitle,
                                index: idx,
                                // valueData: _value,
                              ),
                            ),
                          );
                        },
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
                                    idx); // call showAlertDialog and passing idx
                                // idx is value of the index of the list when the button on pressed,
                                // if button press on first list, so the value idx is [0]
                                // if button press on second list, so the value idx is [1]
                                // etc..
                                // so we can remove item from list by the value of idx
                                // which mean we can choose the item from the list and then we can remove the item
                              },
                            ),
                          ],
                        ),
                      ),
                    )),
              );
            })?.toList() ??
            [],
      ),
    );
  }
}
