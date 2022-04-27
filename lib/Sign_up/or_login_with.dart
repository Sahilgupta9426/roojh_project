import 'package:flutter/material.dart';

class OrLoginWith extends StatelessWidget {
  const OrLoginWith({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.white, Colors.black],
                ),
              ),
            ),
          ),
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
            child: Container(
              height: 1.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.black, Colors.white],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
