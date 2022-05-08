import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//it will get the status of user from 'main.dart'
//if user loggedin is true the it will return isUsersigned is true and take you biometric authentication page from main.dart
final UserLoggedInProvider =
    ChangeNotifierProvider<UserLoggedIn>((ref) => UserLoggedIn());

class UserLoggedIn extends ChangeNotifier {
  bool isUserSignedIn = false;
  void setUserCurrentState(userstate) {
    isUserSignedIn = userstate;
    notifyListeners();
  }

  bool getUserCurrentState() {
    return isUserSignedIn;
  }
}
