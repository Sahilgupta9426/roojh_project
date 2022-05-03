import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../services/auth_services.dart';

class ByPhone extends StatefulWidget {
  const ByPhone({Key? key}) : super(key: key);

  @override
  State<ByPhone> createState() => _ByPhoneState();
}

class _ByPhoneState extends State<ByPhone> {
  final _formKey = GlobalKey<FormState>();
  var phone_no = "";
  var notify;
  final phoneController = TextEditingController();
  late String phone, password, conformpass;

  final passwordController = TextEditingController();
  final confirm_passwordController = TextEditingController();
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  var userexist;
  final phone_noController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  'Phone No',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            TextFormField(
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                filled: true,
                fillColor: HexColor('#F3F6FF'),
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Enter Your Phone Number",
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
              controller: phone_noController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter your number';
                }
              },
            ),
            SizedBox(
              height: 19,
            ),

            // SizedBox(height: 14.49),
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
            Container(
              height: 51.8,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    phone = phoneController.text;

                    userexist = await AuthServices().userExist(phone);
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
                      AuthServices().signUpbyPhone(phone, password, context);
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
