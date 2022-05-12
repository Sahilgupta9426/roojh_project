import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roojh/common_code/topImg.dart';
import 'package:roojh/providerKeepLogin/providers.dart';
import '../services/auth_services.dart';

class Home extends StatefulHookWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userSignedIn;
  var finalusername = "";
  DateTime? lastpresed;
  @override
  Widget build(BuildContext context) {
    userSignedIn = useProvider(
        UserLoggedInProvider); //it will get userlogged in from 'providerKeepLogin/providers.dart'
    //and send to sign out function in 'services/auth_services.dart
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          final now = DateTime.now();
          final maxDuration = Duration(seconds: 2);
          final isWarning =
              lastpresed == null || now.difference(lastpresed!) > maxDuration;
          if (isWarning) {
            lastpresed = DateTime.now();
            final snackBar = SnackBar(
              content: Text('Double Tap To Close'),
              duration: maxDuration,
            );
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(snackBar);
            return false;
          } else {
            return true;
          }
        },
        child: Column(
          children: [
            TopImagesField(),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Text(
                    'Hello User ',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          // AuthController.logOut();
                          AuthServices()
                              .signOut(context, userSignedIn); //for logout
                          Navigator.pushReplacementNamed(context,
                              "/login"); //after logout it render to login page

                          // Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (context) => SignIn()));
                        },
                        child: Text('Logout')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
