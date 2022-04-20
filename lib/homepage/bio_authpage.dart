import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:roojh/local_storage/local_storage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
//old auth

// end old auth

  final LocalAuthentication auth = LocalAuthentication();

  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true,
          stickyAuth: true);
      if (authenticated) {
        await Navigator.pushNamed(context, "/home");
      }
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  void _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

//check auth is available or not start
  static Future<bool> authenticateWithBiometrics() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'Please complete the biometrics to proceed.',
        biometricOnly: true,
      );
    }

    return isAuthenticated;
  }

//check auth is available or not end

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
    _authenticate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(120),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                '$_authorized ',
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
                      controller: pinController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter password valid password';
                        }
                      }),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          getpin = pinController.text;
                          if (getpin == getpin1) {
                            Navigator.pushNamed(context, "/home");
                          }
                        }
                      },
                      child: Text('submit')),
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
            )
          ],
        ),
      )),
    );
  }
}
