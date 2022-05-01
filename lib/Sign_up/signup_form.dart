// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roojh/Sign_up/authenticate_by/main_forgetpassword.dart';
import 'package:roojh/services/auth_services.dart';

//sign up form
class SignupField extends StatefulWidget {
  const SignupField({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupField> createState() => _SignupFieldState();
}

class _SignupFieldState extends State<SignupField> {
  late String username, password, conformpass;
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirm_passwordController = TextEditingController();
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  var userexist;
  var notify;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 2),
                child: Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 26.64),
              child: TextFormField(
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: HexColor('#F3F6FF'),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter Your Username",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                    borderSide: BorderSide(
                      color: HexColor('#CED3E1'),
                      // width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                    borderSide: BorderSide(
                      color: HexColor('#CED3E1'),
                      width: 1.0,
                    ),
                  ),
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                  ),
                ),
                controller: usernameController,
                validator: (val) {
                  if (val!.isEmpty || val.length < 6) {
                    return 'Please Enter more than 6 letters';
                  }
                },
                onChanged: (val) {
                  setState(() {
                    username = val;
                  });
                },
              ),
            ),
            Container(
                child: notify == 'User not confirmed in the system.' ||
                        notify == 'Failed since user is not authorized.'
                    ? Text(
                        ' Username Already Exist',
                        style: TextStyle(color: Colors.red),
                      )
                    : SizedBox()),
            SizedBox(height: 14.49),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 2),
                child: Text(
                  'Password',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 26.64),
              child: TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: HexColor('#F3F6FF'),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter Your Password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                    borderSide: BorderSide(
                      color: HexColor('#CED3E1'),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(98.67),
                      borderSide: BorderSide(
                        color: HexColor('#CED3E1'),
                        width: 1.0,
                      )),
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                  ),
                ),
                controller: passwordController,
                validator: (val) {
                  if (val!.length < 8 || val.isEmpty) {
                    return 'Password must be altleat 8 letters';
                  } else if (password != conformpass) {
                    return 'Password did not match';
                  } else if (!regex.hasMatch(val)) {
                    return 'Example@123';
                  }
                },
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
            ),
            SizedBox(height: 14.49),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 2),
                child: Text(
                  'Confirm password',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 26.64),
              child: TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: HexColor('#F3F6FF'),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Please confirm your password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                    borderSide: BorderSide(
                      color: HexColor('#CED3E1'),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(98.67),
                      borderSide: BorderSide(
                        color: HexColor('#CED3E1'),
                        width: 1.0,
                      )),
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                  ),
                ),
                controller: confirm_passwordController,
                onChanged: (val) {
                  setState(() {
                    conformpass = val;
                  });
                },
                validator: (val) {
                  if (val!.isEmpty || val.length < 8) {
                    return 'Password must be atleast 8 letters';
                  } else if (password != conformpass) {
                    return 'Password did not match';
                  } else if (!regex.hasMatch(val)) {
                    return 'Example@123';
                  }
                },
              ),
            ),
            SizedBox(height: 20.64),
            Padding(
              padding: const EdgeInsets.only(left: 26, right: 25.35),
              child: Container(
                height: 51.8,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      userexist = await AuthServices().userExist(username);
                      print('---------=====-------$userexist');
                      setState(() {
                        notify = userexist;
                      });

                      if (notify == 'User not found in the system.' &&
                          notify != 'User not confirmed in the system.') {
                        setState(() {
                          notify = 'Available';
                        });
                        await Future.delayed(Duration(seconds: 1));

                        Navigator.of(context).push(
                          MaterialPageRoute(
                              // Builder for the nextpage
                              // class's constructor.
                              builder: (context) => AuthenticationBy(
                                    // Date as arguments to
                                    // send to next page.
                                    user: usernameController.text,
                                    pass: passwordController.text,
                                  )),
                        );
                      }
                    }
                  },
                  child: Text('Continue',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(HexColor('#F46524')),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.9),

                        // side: BorderSide(color: Colors.red)
                      ))),
                ),
              ),
            ),
          ],
        ));
  }
}
