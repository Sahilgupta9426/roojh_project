// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MaterialApp(
      title: 'Roojh',
      home: SignIn(),
      theme: new ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 249, 249)),
      routes: {
        // "/login": (context) => LoginPage(),
        // "/home": (context) => Home()
      }));
}

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
            color: Colors.white,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 26, right: 192, top: 26, bottom: 20),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Form(
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
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: HexColor('#F3F6FF'),
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Username",
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
                        ),
                      ),
                    ),
                    SizedBox(height: 14.49),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, bottom: 2),
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 26.64),
                      child: TextFormField(
                        // style: style,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: HexColor('#F3F6FF'),
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Password",
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
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.85, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(0)),
                              onPressed: () {},
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20.64),
                    Padding(
                      padding: const EdgeInsets.only(left: 26, right: 25.35),
                      child: Container(
                        height: 51.8,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          color: HexColor('#F46524'),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.9),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('New here',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Create Account',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: HexColor('#F46524'))),
                      ),
                    ],
                  ),
                ),
                Row(children: <Widget>[
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
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 1,
                    // indent: 37,
                    endIndent: 37,

                    color: Colors.black,
                  )),
                ]),
                SizedBox(height: 16),
                Container(
                  height: 51,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 26, right: 25.35),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              HexColor('#ffeae9')),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),

                            // side: BorderSide(color: Colors.red)
                          ))),
                      onPressed: () {
                        print("it's facebook button");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 29,
                              width: 30,
                              alignment: Alignment.centerRight,
                              child: Image.asset('icons/facebook.png')
                              // Icon(
                              //   Icons.facebook_rounded,
                              //   size: 29.67,
                              // ),

                              ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              'Sign In With Facebook',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  height: 51,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 26, right: 25.35),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              HexColor('#ffeae9')),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),

                            // side: BorderSide(color: Colors.red)
                          ))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 29,
                              width: 30,
                              alignment: Alignment.centerRight,
                              child: Image.asset('icons/google.png')
                              // Icon(
                              //   Icons.facebook_rounded,
                              //   size: 29.67,
                              // ),

                              ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              'Sign In With Google',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
