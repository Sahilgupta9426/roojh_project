import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

//sign up form
class SignupField extends StatelessWidget {
  const SignupField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
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
          ),
        ),
        SizedBox(height: 20.64),
        Padding(
          padding: const EdgeInsets.only(left: 26, right: 25.35),
          child: Container(
            height: 51.8,
            width: MediaQuery.of(context).size.width,
            // child: RaisedButton(
            //   color: HexColor('#F46524'),
            //   child: const Text(
            //     'Sign up',
            //     style: TextStyle(fontSize: 20, color: Colors.white),
            //   ),
            //   onPressed: () {},
            //   shape: new RoundedRectangleBorder(
            //     borderRadius: new BorderRadius.circular(25.9),
            //   ),
            // ),
            child: ElevatedButton(
              onPressed: () {},
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
        )
      ],
    ));
  }
}
