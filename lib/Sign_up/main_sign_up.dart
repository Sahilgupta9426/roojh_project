import 'package:flutter/material.dart';
import 'package:roojh/Sign_up/or_login_with.dart';
import 'package:roojh/common_code/topImg.dart';
import 'package:roojh/Sign_up/signup_form.dart';
import '../common_code/login_with_buttons.dart';
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
              children: const [
                TopImagesField(), //top images which in saved in 'common_code/topImg.dart'
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
                SignupField(), //Sign up Form Field which is saved in 'Sign_up/Signup_form.dart'
                SizedBox(
                  height: 32,
                ),
                AlreadyHaveAccount(), //to redirect in sign in page saved in 'Sign_up/already_have_account.dart'
                OrLoginWith(), //divider between signup form and login with buttons saved in 'Sign_up/or_login_with.dart'
                SizedBox(height: 16),
                FacebookLogin(), //login with facebook.saved in'common_code/login_with_buttons.dart'
                SizedBox(height: 6),
                GoogleLogin(), //login with google.saved in'common_code/login_with_buttons.dart'
                SizedBox(
                  height: 38,
                )
              ],
            )));
  }
}
