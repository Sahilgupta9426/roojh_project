import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roojh/Login_page/topImg.dart';

import 'create_account.dart';
import 'login_form.dart';
import 'login_with_buttons.dart';
import 'or_login_with.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                LoginField(),
                SizedBox(
                  height: 32,
                ),
                Create_Acoount(),
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
