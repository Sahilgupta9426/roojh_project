import 'dart:convert';
import 'package:get/get.dart';
import 'package:roojh/Login_page/main_login.dart';
import 'package:roojh/homepage/home.dart';
import 'package:roojh/pin_password/bio_authpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../homepage/bio_authpage.dart';

class AuthController {
  static login(Map userData) async {
    print(userData);

    var response = {"user_id": "sahil9802", "user_token": "xx8894jjdsdhsuur"};
    var any = await SharedPreferences.getInstance();

    any.setString("userData", json.encode(response));
    Get.off(() => AuthPage());
  }

  Future<bool> tryAutoLogin() async {
    var any = await SharedPreferences.getInstance();
    if (!any.containsKey("userData")) {
      return false;
    } else {
      // final extractedUserData =
      //     json.decode(any.getString('userData').toString());

      // print(extractedUserData['user_id']);
      // print(extractedUserData['user_token']);

      return true;
    }
  }

  static logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.off(() => SignIn());
  }
}
