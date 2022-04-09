import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

//divider between form and login with buttons
class OrLoginWith extends StatelessWidget {
  const OrLoginWith({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
          child: Divider(
        thickness: 1,
        indent: 37,
        // endIndent: 100,
        color: Colors.black,
      )),
      SizedBox(
        width: 10,
      ),
      Text(
        "Or Login With",
        style: TextStyle(
          fontWeight: FontWeight.w300,
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
          child: Divider(
        thickness: 1,
        endIndent: 37,
        color: Colors.black,
      )),
    ]);
  }
}
