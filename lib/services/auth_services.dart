import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:roojh/Login_page/main_login.dart';

import 'package:roojh/pin_password/bio_authpage.dart';
import '../Sign_up/cofirmation_code/confirmation_page.dart';

class AuthServices {
  signUp(email, username, password, context) async {
    try {
      Map<CognitoUserAttributeKey, String> userAttributes = {
        CognitoUserAttributeKey.email: email
      };
      Amplify.Auth.signUp(
              username: username,
              password: password,
              options: CognitoSignUpOptions(userAttributes: userAttributes))
          .then((value) => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ConfirmCode(username: username)))
              });
    } on AuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  cofirmUser(username, confirmationCode, context) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: username, confirmationCode: confirmationCode);
      if (res.isSignUpComplete) {
        // Navigator.of(context).pop();
        // Navigator.of(context).pop();
        var notify = '1';
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => SignIn(
                  notify: notify,
                )));
      }
    } on AuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  //sign in
  sigIn(username, password, context) async {
    try {
      SignInResult res =
          await Amplify.Auth.signIn(username: username, password: password);
      if (res.isSignedIn) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AuthPage()));
      }

      print('results------------- $res');

      // userSignedIn.setUserCurrentState(res.isSignedIn);
    } on AuthException catch (e) {
      print('hello----');
      print(e.message);
      return e.message;
    }
  }

  //signOut
  signOut(context, userSignedIn) async {
    SignOutResult res = await Amplify.Auth.signOut();

    userSignedIn.setUserCurrentState(false);
  }

  Future userExist(username) async {
    try {
      SignInResult res =
          await Amplify.Auth.signIn(username: username, password: '0000');
    } on AuthException catch (e) {
      return e.message;
    }
  }
}
