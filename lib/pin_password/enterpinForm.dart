import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../common_code/topImg.dart';
import '../local_storage/local_storage.dart';

// Enter Pin Password form

class EnterPin extends StatefulWidget {
  const EnterPin({Key? key}) : super(key: key);

  @override
  State<EnterPin> createState() => _EnterPinState();
}

class _EnterPinState extends State<EnterPin> {
  //form
  final _formKey = GlobalKey<FormState>();

  var getpin = "";
  final pinController = TextEditingController();
  //form end
  // local storage
  final LocalStorage secureStorage = LocalStorage();
  // local storage end
  var getpin1 = '';

  void initState() {
    super.initState();

    secureStorage.readSecureData('pin1').then((value) => getpin1 = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            TopImagesField(),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Please Enter your Pin Password ',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60.0, right: 60),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: pinController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter password valid password';
                            }
                          }),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  HexColor('#F46524')),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.9),

                                // side: BorderSide(color: Colors.red)
                              ))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              getpin = pinController.text;
                              if (getpin == getpin1) {
                                // Navigator.pushNamed(context, "/home");
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              }
                            }
                          },
                          child: Text('submit')),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/createpin");
                        },
                        child: Text(
                          'create pin',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ))
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
