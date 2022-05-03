import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:roojh/Login_page/main_login.dart';
import 'package:roojh/pin_password/bio_authpage.dart';
import '../Sign_up/cofirmation_code/confirmation_page.dart';

class AuthServices {
  StreamSubscription hubSubscription =
      Amplify.Hub.listen([HubChannel.Auth], (hubEvent) {
    switch (hubEvent.eventName) {
      case 'SIGNED_IN':
        print('USER IS SIGNED IN');
        break;
      case 'SIGNED_OUT':
        print('USER IS SIGNED OUT');
        break;
      case 'SESSION_EXPIRED':
        print('SESSION HAS EXPIRED');
        break;
      case 'USER_DELETED':
        print('USER HAS BEEN DELETED');
        break;
    }
  });
  //sign up by email
  signUp(email, password, context) async {
    try {
      Map<CognitoUserAttributeKey, String> userAttributes = {
        CognitoUserAttributeKey.email: email,
        CognitoUserAttributeKey.phoneNumber: ''
      };
      Amplify.Auth.signUp(
              username: email,
              password: password,
              options: CognitoSignUpOptions(userAttributes: userAttributes))
          .then((value) => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ConfirmCode(email: email)))
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
//end sign up by email

//sign up by phone
  signUpbyPhone(phone, password, context) async {
    try {
      Map<CognitoUserAttributeKey, String> userAttributes = {
        CognitoUserAttributeKey.email: '',
        CognitoUserAttributeKey.phoneNumber: phone
      };
      Amplify.Auth.signUp(
              username: phone,
              password: password,
              options: CognitoSignUpOptions(userAttributes: userAttributes))
          .then((value) => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ConfirmCode(email: phone)))
              });
    } on AuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  cofirmUserByPhone(username, confirmationCode, context) async {
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

//end sign up by phone
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
