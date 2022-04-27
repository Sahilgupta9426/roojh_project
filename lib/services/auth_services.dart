import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:flutter/material.dart';

import 'package:roojh/pin_password/bio_authpage.dart';

import '../Sign_up/cofirmation_code/confirmation_page.dart';

class AuthServices {
  signUp(email, username, password, context) async {
    try {
      print(email);
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
    }
  }

  cofirmUser(username, confirmationCode, context) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: username, confirmationCode: confirmationCode);
      if (res.isSignUpComplete) {
        // Navigator.of(context).pop();
        // Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, '/login');
      }
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  //sign in
  sigIn(username, password, context) async {
    try {
      SignInResult res =
          await Amplify.Auth.signIn(username: username, password: password);
      if (res.isSignedIn) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AuthPage()));
      }

      print('results------------- $res');

      // userSignedIn.setUserCurrentState(res.isSignedIn);
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  //signOut
  signOut(context, userSignedIn) async {
    SignOutResult res = await Amplify.Auth.signOut();

    userSignedIn.setUserCurrentState(false);
  }

  // userExist(context, username) async {
  //   var res = await Amplify.Auth.getCurrentUser();
  //   if(res.username==username)
  // }
}
