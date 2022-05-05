import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ByPhone extends StatefulWidget {
  const ByPhone({Key? key}) : super(key: key);

  @override
  State<ByPhone> createState() => _ByPhoneState();
}

class _ByPhoneState extends State<ByPhone> {
  final _formKey = GlobalKey<FormState>();
  var phone_no = "";

  final phone_noController = TextEditingController();
  late String _selectedCountryCode;
  var notify;

  @override
  Widget build(BuildContext context) {
    var notify;
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
            Container(
              // margin: EdgeInsets.only(bottom: 10, top: 10),
              // height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 48.87,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          color: HexColor('#F3F6FF'),
                          // border: Border.all(
                          //   color: HexColor('#CED3E1'),
                          // ),
                          border: Border(
                              bottom: BorderSide(color: HexColor('#CED3E1')),
                              left: BorderSide(
                                color: HexColor('#CED3E1'),
                              ),
                              top: BorderSide(color: HexColor('#CED3E1')),
                              right: BorderSide(
                                color: HexColor('#CED3E1'),
                              )),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(98.67),
                            bottomLeft: Radius.circular(98.67),
                            topRight: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          )),
                      child: CountryCodePicker(
                        padding: EdgeInsets.all(2),
                        textStyle: TextStyle(fontSize: 17, color: Colors.black),
                        initialSelection: 'IN',
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        favorite: ['+91', 'IN'],
                        showFlagMain: false,
                        onInit: (value) {
                          _selectedCountryCode = value.toString();
                        },
                        onChanged: (value) {
                          setState(() {
                            _selectedCountryCode = value.toString();
                          });
                        },
                      )),
                  Expanded(
                    child: Container(
                      // height: 49.87,
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: HexColor('#F3F6FF'),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 14.5, 20.0, 14.5),
                            hintText: "Enter Your Phone Number",
                            enabledBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(98.67),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(98.67),
                                // topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(98.67),
                                // bottomLeft: Radius.circular(0),
                              ),
                              borderSide: BorderSide(
                                color: HexColor('#CED3E1'),
                                // width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(98.67),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(98.67),
                                  topLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(98.67),
                                  bottomLeft: Radius.circular(0),
                                ),
                                borderSide: BorderSide(
                                  color: HexColor('#CED3E1'),
                                  width: 1.0,
                                )),
                            errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: HexColor('#CED3E1'),
                                width: 1.0,
                              ),
                              // borderRadius: BorderRadius.circular(98.67),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(98.67),
                                topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(98.67),
                                bottomLeft: Radius.circular(0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(98.67),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(98.67),
                                topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(98.67),
                                bottomLeft: Radius.circular(0),
                              ),
                            )),
                        controller: phone_noController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your number';
                          }
                          return null;
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(child: notify != null ? Text('not valid') : SizedBox()),
            SizedBox(
              height: 19,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 9),
                child: Text(
                  'We are sending authentication link on above number',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 80),
            Container(
              height: 51.8,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      phone_no = phone_noController.text;
                      if (phone_no.length < 10) {
                        notify = 'Please enter a valid phone no';
                      }
                      print(_selectedCountryCode);
                    });
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
