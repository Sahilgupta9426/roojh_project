import 'package:flutter/material.dart';

// import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    return Scaffold(
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Text('hello '),
            ElevatedButton(
                // onPressed: () async {
                //   final SharedPreferences sharedPreferences =
                //       await SharedPreferences.getInstance();

                //   sharedPreferences.remove('username');

                //   Navigator.pushNamed(context, "/login");
                // },
                onPressed: () {
                  // AuthController.logOut();
                  Navigator.pushReplacementNamed(context, "/login");
                },
                child: Text('logout'))
          ],
        ),
      )),
    );
  }
}
