import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../services/auth_services.dart';

// ignore: must_be_immutable
class ByEmail extends StatefulWidget {
  const ByEmail({Key? key}) : super(key: key);

  @override
  State<ByEmail> createState() => _ByEmailState();
}

class _ByEmailState extends State<ByEmail> {
  final _formKey = GlobalKey<FormState>();

  var notify;
  final emailController = TextEditingController();
  late String email, password, conformpass;

  final passwordController = TextEditingController();
  final confirm_passwordController = TextEditingController();
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  var userexist;

  @override
  Widget build(BuildContext context) {
    // final username = widget.user;
    // final password = widget.pass;
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Text(
                  'Email id ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                filled: true,
                fillColor: HexColor('#F3F6FF'),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 15.0),
                hintText: "Enter Your Email Id",
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
                    )),
                errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(98.67),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(98.67),
                ),
              ),
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter email';
                }
                return null;
              },
            ),
            Container(
                padding: EdgeInsets.only(top: 5),
                child: notify == 'User not confirmed in the system.' ||
                        notify == 'Failed since user is not authorized.'
                    ? const Text(
                        'Email Already Exist',
                        style: TextStyle(color: Colors.red),
                      )
                    : const SizedBox()),
            SizedBox(height: 14.49),
            Align(
              alignment: Alignment.topLeft,
              child: const Text(
                'Password',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
                errorStyle: const TextStyle(color: Colors.red, fontSize: 15),
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
                return null;
              },
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
            ),
            SizedBox(height: 14.49),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Confirm password',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
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
                return null;
              },
            ),
            const SizedBox(
              height: 19,
            ),

            // SizedBox(height: 80),
            Container(
              height: 51.8,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    email = emailController.text;

                    userexist = await AuthServices().userExist(email);
                    print('---------=====-------$userexist');
                    setState(() {
                      notify = userexist;
                    });

                    if (notify == 'User not found in the system.' &&
                        notify != 'User not confirmed in the system.') {
                      setState(() {
                        notify = 'Available';
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      AuthServices().signUp(email, password, context);
                    }

                    _formKey.currentState!.save();
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
            )
          ],
        ));
  }
}
