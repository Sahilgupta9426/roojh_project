import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roojh/Login_page/main_login.dart';
import 'package:roojh/common_code/topImg.dart';
import 'package:roojh/providers.dart';

import '../services/auth_services.dart';

// import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulHookWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userSignedIn;
  var finalusername = "";
  // @override
  // void initState() {
  //   getValidationData().whenComplete(() async {
  //     // Timer(Duration(seconds: 2),
  //     //     () => Get.to(finalusername == null ? LoginField() : Home()));
  //   });
  //   super.initState();
  // }

  // Future getValidationData() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   var obtainedUsername = sharedPreferences.getString('username');
  //   setState(() {
  //     finalusername = obtainedUsername!;
  //   });
  // }
  //2nd part

  @override
  Widget build(BuildContext context) {
    userSignedIn = useProvider(UserLoggedInProvider);
    return Scaffold(
      body: Column(
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
                        AuthServices().signOut(context, userSignedIn);
                        Navigator.pushReplacementNamed(context, "/login");
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Text('logout')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
