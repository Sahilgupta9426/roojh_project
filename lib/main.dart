// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roojh/Sign_up/main_sign_up.dart';
// import 'package:roojh/homepage/createpin.dart';
import 'package:roojh/homepage/home.dart';
import 'package:roojh/pin_password/bio_authpage.dart';
import 'package:roojh/pin_password/createpin.dart';
// import 'package:roojh/root/root.dart';
import 'Login_page/main_login.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'controller/auth_controller.dart';
// import 'homepage/bio_authpage.dart';

void main() {
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // var user = preferences.getString('username');

  runApp(StartPoint());
}

class StartPoint extends StatefulWidget {
  const StartPoint({Key? key}) : super(key: key);

  @override
  State<StartPoint> createState() => _StartPointState();
}

class _StartPointState extends State<StartPoint> {
  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    return GetMaterialApp(
        title: 'Roojh',
        home: SignIn(),
        // home: FutureBuilder(
        //     future: authController.tryAutoLogin(),
        //     builder: (contect, authResult) {
        //       if (authResult.connectionState == ConnectionState.waiting) {
        //         return Center(
        //           child: CircularProgressIndicator(
        //               valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
        //         );
        //       } else {
        //         if (authResult.data == true) {
        //           return Home();
        //         }
        //         return SignIn();
        //       }
        //     }),
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 255, 249, 249)),
        routes: {
          "/login": (context) => SignIn(),
          "/signup": (context) => SignUp(),
          "/home": (context) => Home(),
          "/auth": (context) => AuthPage(),
          "/createpin": (context) => CreatePin(),
        });
  }
}















// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:flutter/services.dart';

// void main() => runApp(MaterialApp(
//       home: AuthApp(),
//     ));

// class AuthApp extends StatefulWidget {
//   @override
//   _AuthAppState createState() => _AuthAppState();
// }

// class _AuthAppState extends State<AuthApp> {
//   LocalAuthentication auth = LocalAuthentication();
//   bool? _canCheckBiometric;
//   List<BiometricType>? _availableBiometric;
//   String authorized = "Not authorized";

//   //checking bimetrics
//   //this function will check the sensors and will tell us
//   // if we can use them or not
//   Future<void> _checkBiometric() async {
//     bool? canCheckBiometric;
//     try {
//       canCheckBiometric = await auth.canCheckBiometrics;
//     } on PlatformException catch (e) {
//       print(e);
//     }
//     if (!mounted) return;

//     setState(() {
//       _canCheckBiometric = canCheckBiometric;
//     });
//   }

//   //this function will get all the available biometrics inside our device
//   //it will return a list of objects, but for our example it will only
//   //return the fingerprint biometric
//   Future<void> _getAvailableBiometrics() async {
//     List<BiometricType>? availableBiometric;
//     try {
//       availableBiometric = await auth.getAvailableBiometrics();
//     } on PlatformException catch (e) {
//       print(e);
//     }
//     if (!mounted) return;

//     setState(() {
//       _availableBiometric = availableBiometric;
//     });
//   }

//   //this function will open an authentication dialog
//   // and it will check if we are authenticated or not
//   // so we will add the major action here like moving to another activity
//   // or just display a text that will tell us that we are authenticated
//   Future<void> _authenticate() async {
//     bool authenticated = false;
//     try {
//       authenticated = await auth.authenticateWithBiometrics(
//           localizedReason: "Scan your finger print to authenticate",
//           useErrorDialogs: true,
//           stickyAuth: false);
//     } on PlatformException catch (e) {
//       print(e);
//     }
//     if (!mounted) return;

//     setState(() {
//       authorized =
//           authenticated ? "Autherized success" : "Failed to authenticate";
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     _checkBiometric();
//     _getAvailableBiometrics();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: <Widget>[
//             Center(
//               child: RaisedButton(
//                 onPressed: _authenticate,
//                 child: Text("Get Biometric"),
//               ),
//             ),
//             Text("Can check biometric: $_canCheckBiometric"),
//             Text("Available biometric: $_availableBiometric"),
//             Text("Current State: $authorized"),
//           ],
//         ),
//       ),
//     );
//   }
// }















// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Demo App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return MyHomePageState();
//   }
// }

// class MyHomePageState extends State<MyHomePage> {
//   List<BiometricType> availableOptions = [];
//   final LocalAuthentication auth = LocalAuthentication();
//   String message = "";

//   @override
//   void initState() {
//     super.initState();
//     auth.isDeviceSupported().then((value) {
//       if (value) {
//         checkAvailableResult();
//       } else {
//         setState(() {
//           message = "Not supported or added in device";
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Authentication'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Text(message),
//             const SizedBox(
//               height: 10,
//             ),
//             ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: availableOptions.length,
//                 itemBuilder: (context, index) {
//                   BiometricType type = availableOptions[index];
//                   return ListTile(
//                     onTap: () async {
//                       bool didAuthenticate = await auth.authenticate(
//                           localizedReason: 'Test Authenticate');
//                       setState(() {
//                         if (didAuthenticate) {
//                           message = "Success";
//                         } else {
//                           message = "Fail";
//                         }
//                       });
//                     },
//                     title: Text(type.name),
//                   );
//                 })
//           ],
//         ));
//   }

//   void checkAvailableResult() async {
//     bool canCheckBiometrics = await auth.canCheckBiometrics;

//     if (canCheckBiometrics) {
//       availableOptions = await auth.getAvailableBiometrics();
//     } else {
//       message = "Unable to check biometric";
//     }
//     setState(() {});
//   }
// }
