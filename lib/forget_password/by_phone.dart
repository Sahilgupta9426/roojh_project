import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:hexcolor/hexcolor.dart';

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
  List<String> _countryCodes = ['+91', '+23'];

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
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: HexColor('#F3F6FF'),
                        border: Border.all(
                          color: HexColor('#CED3E1'),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(98.67),
                          bottomLeft: Radius.circular(98.67),
                        )),
                    child: CountryCodePicker(
                      padding: EdgeInsets.zero,
                      textStyle: TextStyle(fontSize: 17, color: Colors.black),
                      initialSelection: 'IN',
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      favorite: ['+91', 'IN'],
                      showFlagMain: false,
                    )),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: HexColor('#F3F6FF'),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Enter Your Phone Number",
                      enabledBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(98.67),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(98.67),
                          topLeft: Radius.circular(0),
                          bottomRight: Radius.circular(98.67),
                          bottomLeft: Radius.circular(0),
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
                      errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(98.67),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(98.67),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(98.67),
                          topLeft: Radius.circular(0),
                          bottomRight: Radius.circular(98.67),
                          bottomLeft: Radius.circular(0),
                        ),
                      ),
                    ),
                    controller: phone_noController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your number';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
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

                      // final SharedPreferences sharedPreferences =
                      //     await SharedPreferences.getInstance();
                      // sharedPreferences.setString(
                      //     'phone_no', phone_noController.text);
                      // Navigator.pushNamed(context, "/auth");
                    });
                    _formKey.currentState!.save();
                    // print(_loginUserData);
                    // AuthController.login(_loginUserData);
                    // Navigator.pushNamed(context, "/auth");
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
