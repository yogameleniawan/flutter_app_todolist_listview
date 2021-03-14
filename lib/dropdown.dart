import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  const DropDown({
    Key key,
    @required this.listItem,
    @required String newValue,
    @required this.dropdownOnChanged,
  })  : _newValue = newValue,
        super(key: key);

  final List<String> listItem;
  final String _newValue;
  final Function dropdownOnChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: DropdownButton<String>(
        items: listItem.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: _newValue,
        onChanged: dropdownOnChanged,
      ),
    );
  }
}
