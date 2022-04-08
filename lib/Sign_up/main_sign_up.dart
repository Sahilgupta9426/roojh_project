import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roojh/Login_page/topImg.dart';
import 'package:roojh/Sign_up/signup_form.dart';

import '../Login_page/login_with_buttons.dart';
import 'already_have_account.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(0),
            color: Colors.white,
            child: ListView(
              children: [
                TopImagesField(),
                Padding(
                  padding: EdgeInsets.only(
                      left: 26, right: 192, top: 20, bottom: 20),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SignupField(),
                SizedBox(
                  height: 32,
                ),
                AlreadyHaveAccount(),
                OrLoginWith(),
                SizedBox(height: 16),
                Facebook_Login(),
                SizedBox(height: 6),
                Google_login(),
                SizedBox(
                  height: 38,
                )
              ],
            )));
  }
}

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
