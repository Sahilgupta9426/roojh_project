import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already have an account?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/login");
            },
            child: Text('Sign In',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: HexColor('#F46524'))),
          ),
        ],
      ),
    );
  }
}
