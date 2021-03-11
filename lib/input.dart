import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            new BorderRadius.circular(10.0), // to custom border radius
      ),
      child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 2),
          child: TextFormField(
              controller: etInput,
              decoration: InputDecoration(
                labelText: "Your Activity Today",
                hintText: "Insert your activity today",
                border: InputBorder.none,
              ))),
    );
  }
}
