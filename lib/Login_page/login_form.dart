import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roojh/forget_password/main_forgetpassword.dart';
import 'package:roojh/homepage/home.dart';

import '../services/auth_services.dart';
// import 'package:roojh/forget_password/main_forgetpassword.dart';
// import 'package:shared_preferences/shared_preferences.dart';

//login form
class LoginField extends StatefulWidget {
  const LoginField({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  @override
  Widget build(BuildContext context) {
    Color color = HexColor('#F46524');
    final _formKey = GlobalKey<FormState>();
    var username = "";
    var password = "";
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
        key: _formKey,
        child: Column(
          children: [
            const Align(
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
                      )),
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                  ),
                ),
                controller: usernameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your email id';
                  }
                },
              ),
            ),
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter password';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.85, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ForgetPassButton() //in the bottom
                ],
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing')),
                      );

                      setState(() {
                        username = usernameController.text;
                        password = passwordController.text;

                        AuthServices().sigIn(username, password, context);
                      });
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //       duration: Duration(seconds: 5),
                      //       backgroundColor: Colors.red,
                      //       content: Text(
                      //         'Invalid username and password',
                      //         style: TextStyle(color: Colors.white),
                      //       )),
                      // );
                    }
                  },
                  child: Text('Sign in',
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
            )
          ],
        ));
  }
}

class ForgetPassButton extends StatelessWidget {
  const ForgetPassButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
        onPressed: () {
          // Navigator.pushNamed(context, "/forgetPass");
          Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const ForgetPassword(),
                // const Home(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, Widget child) {
                  // animation = CurvedAnimation(
                  //     parent: animation,
                  //     curve: Curves.decelerate);
                  animation = CurvedAnimation(
                      parent: animation, curve: Curves.easeOutCubic);
                  return ScaleTransition(
                    scale: animation,
                    alignment: Alignment.center,
                    child: child,
                  );
                },
              ));
        },
        child: Text(
          'Forget Password?',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
        ));
  }
}
