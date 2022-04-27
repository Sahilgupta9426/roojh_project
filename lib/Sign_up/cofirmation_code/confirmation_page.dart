import 'package:flutter/material.dart';
import 'package:roojh/common_code/topImg.dart';

import '../../services/auth_services.dart';

class ConfirmCode extends StatefulWidget {
  final username;
  ConfirmCode({this.username});
  // const ConfirmCode({Key? key}) : super(key: key);

  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  late String code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          TopImagesField(),
          SizedBox(
            height: 50,
          ),
          Text(
            'Verify Your Email Here',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: Container(
              // padding: EdgeInsets.all(8.0),
              height: 300,
              width: MediaQuery.of(context).size.width - 30.0,
              // decoration: BoxDecoration(color: Colors.white, boxShadow: [
              //   BoxShadow(color: Colors.grey.withOpacity(0.7))
              // ]),
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(hintText: ''),
                  onChanged: (val) {
                    setState(() {
                      code = val;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text('The otp has been sent to your Email Id'),
                SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {
                      AuthServices().cofirmUser(widget.username, code, context);
                    },
                    child: Text('Confirm')),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
          ),
        ],
      ),
    ));
  }
}
