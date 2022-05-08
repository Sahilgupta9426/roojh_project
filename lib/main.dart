// ignore_for_file: deprecated_member_use

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roojh/Sign_up/main_sign_up.dart';
import 'package:roojh/homepage/home.dart';
import 'package:roojh/pin_password/bio_authpage.dart';
import 'package:roojh/pin_password/createpin.dart';
import 'package:roojh/providerKeepLogin/providers.dart';
import 'Login_page/main_login.dart';
import 'amplifyconfiguration.dart';
import 'forget_password/main_forgetpassword.dart';

Future<void> main() async {
  runApp(ProviderScope(child: StartPoint()));
}

class StartPoint extends StatefulHookWidget {
  const StartPoint({Key? key}) : super(key: key);

  @override
  State<StartPoint> createState() => _StartPointState();
}

class _StartPointState extends State<StartPoint> {
  var userLoggedIn;
//it will inform either confugration of amplify is successful or not ,and other problem in amplify
  bool _amplifyConfigured = false;

  bool checkAuthStatus = false;
  AmplifyAuthCognito auth = AmplifyAuthCognito();

  Future<void> _configuredAmplify() async {
    //call this function in void initState()
    if (!mounted) return;
    // AmplifyAuthCognito auth = AmplifyAuthCognito();

    await Amplify.addPlugin(auth);
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print('Already Configured');
    }
    try {
      getUserStatus();
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _configuredAmplify();
  }

//End ---- it will inform either confugration of amplify is successful or not ,and other problem in amplify
  @override
  Widget build(BuildContext context) {
    userLoggedIn = useProvider(UserLoggedInProvider);

    return MaterialApp(
        title: 'Roojh',
        home: Scaffold(
            body:
                _amplifyConfigured //if Amplify cognito don't support any OS then it
                    ? checkAuthStatus //check user user auth status
                        ? userLoggedIn
                                .getUserCurrentState() //check user is login or not
                            ? AuthPage() //if user logen in it will take to the biometric authentication page
                            : SignIn(
                                //if user no signed in then it will take to the sign in page
                                notify: '0',
                              )
                        : Center(
                            child: Text(
                                'Loading')) //sow loading untill AmplifyCognito status don't confirmed
                    : Center(
                        child: Text(
                            'Device Does Not Application')) //if device does not support
            ),
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 255, 249, 249)),
        routes: {
          "/login": (context) => SignIn(notify: '0'),
          "/forgetPass": (context) => ForgetPassword(),
          "/signup": (context) => SignUp(),
          "/home": (context) => Home(),
          "/auth": (context) => AuthPage(),
          "/createpin": (context) => CreatePin(),
        });
  }

//it will get status of user whether is sign in or sign out and take the status in providerKeepLogin/provider.dart

  getUserStatus() {
    handleAuth().then((val) {
      if (val.isSignedIn) {
        userLoggedIn.setUserCurrentState(val.isSignedIn);
        setState(() {
          checkAuthStatus = true;
        });
      } else {
        setState(() {
          checkAuthStatus = true;
        });
        return SignIn(
          notify: '0',
        );
      }
    });
  }

  handleAuth() async {
    var authStatus = await auth.fetchAuthSession();
    return authStatus;
  }
  // End ---- it will get status of user is sign in or sign out
}
