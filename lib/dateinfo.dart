import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInfo extends StatelessWidget {
  const DateInfo({
    Key key,
    @required this.selectedDate,
  }) : super(key: key);

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomLeft,
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // alignment start
          children: <Widget>[
            Text(
              "My Day",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
            Text(
              DateFormat('EEEEEE, MMMM d').format(
                  selectedDate), // get date format with EEEEEE (Full character of Day -> Sunday, Monday, Tuesday)
              // EEE (Just 3 character of day name -> Sun, Mon, Tue)
              // MMMM (Full character of Month -> January, February, March)
              // MM (Just 3 character of month name -> Jan, Feb, Mar)
              // d show the date (1 - 31)
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
