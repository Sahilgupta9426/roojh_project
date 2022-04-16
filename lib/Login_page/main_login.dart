import 'package:flutter/material.dart';

import 'package:roojh/common_code/topImg.dart';
import 'create_account.dart';
import 'login_form.dart';
import '../common_code/login_with_buttons.dart';
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
                TopImagesField(), //top images which in saved in 'common_code/topImg.dart'
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
                LoginField(), //Login Form Field which is saved in 'Login_page/login_form.dart'
                SizedBox(
                  height: 32,
                ),
                Create_Acoount(), //text button which redirect in 'sign up page' and this code saved in Login_page/create_account.dart
                OrLoginWith(), //it's a divider between from and login with button. this code is saved in 'Login_page/or_login_with.dart'
                SizedBox(height: 16),
                Facebook_Login(), //login with facebook button saved in 'common_code/login_with_button.dart'
                SizedBox(height: 6),
                Google_login(), //login with google button saved in 'common code/login_with_button.dart'
                SizedBox(
                  height: 38,
                )
              ],
            )));
  }
}
