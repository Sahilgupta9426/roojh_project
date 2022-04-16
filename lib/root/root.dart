import 'package:flutter/material.dart';

import 'package:roojh/Login_page/main_login.dart';
import 'package:roojh/homepage/home.dart';

enum Authstatus { notLoggedIn, loggedIn }

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  Authstatus _authStatus = Authstatus.notLoggedIn;
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // get the state,check current user,
  }

  @override
  Widget build(BuildContext context) {
    Widget retVar;
    switch (_authStatus) {
      case Authstatus.notLoggedIn:
        retVar = SignIn();
        break;
      case Authstatus.loggedIn:
        retVar = Home();
        break;
      default:
        retVar = Error();
    }
    return retVar;
  }
}

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('error'),
    );
  }
}
