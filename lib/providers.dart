import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
