import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:roojh/local_storage/local_storage.dart';

class CreatePin extends StatefulWidget {
  const CreatePin({Key? key}) : super(key: key);

  @override
  State<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  final _formKey = GlobalKey<FormState>();
  final LocalStorage securestorage = LocalStorage();
  var pin1 = "";
  var pin2 = "";
  final pin1Controller = TextEditingController();
  final pin2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Padding(
        padding: const EdgeInsets.all(120),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Create Pin',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: pin1Controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter password valid password';
                        }
                      }),
                  TextFormField(
                      controller: pin2Controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter password valid password';
                        }
                      }),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          pin1 = pin1Controller.text;
                          pin2 = pin2Controller.text;
                          if (pin1 == pin2) {
                            securestorage.writeSecureData('pin1', pin1);

                            Navigator.pushNamed(context, "/auth");
                          }
                        }
                      },
                      child: Text('submit'))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
