import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roojh/Sign_up/authenticate_by/by_email.dart';
import 'package:roojh/Sign_up/authenticate_by/by_phone.dart';

import 'package:roojh/common_code/topImg.dart';

import '../../common_code/login_with_buttons.dart';
import '../already_have_account.dart';
import '../or_login_with.dart';

class AuthenticationBy extends StatefulWidget {
  const AuthenticationBy({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthenticationBy> createState() => _AuthenticationByState();
}

class _AuthenticationByState extends State<AuthenticationBy> {
  String radioButtonItem = 'ONE';
  Color radio_color = HexColor('#F46524');

  // Group Value for Radio Button.
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TopImagesField(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Authenticate Account By',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  // Text('Selected Radio Item = ' + '$radioButtonItem',
                  //     style: TextStyle(fontSize: 21)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: radio_color,
                        value: 1,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'ONE';
                            id = 1;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Phone No',
                        style: new TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Radio(
                        visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: radio_color,
                        value: 2,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'TWO';
                            id = 2;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Email Id',
                        style: new TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      child: radioButtonItem == 'ONE' ? ByPhone() : ByEmail())
                  // ByEmail(),
                ],
              ),
            ),

            SizedBox(
              height: 32,
            ),
            AlreadyHaveAccount(), //to redirect in sign in page saved in 'Sign_up/already_have_account.dart'
            OrLoginWith(), //divider between signup form and login with buttons saved in 'Sign_up/or_login_with.dart'
            SizedBox(height: 16),
            FacebookLogin(), //login with facebook.saved in'common_code/login_with_buttons.dart'
            SizedBox(height: 6),
            GoogleLogin(),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    ));
  }
}
