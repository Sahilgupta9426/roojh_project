// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'Login_page/main_login.dart';

void main() {
  runApp(MaterialApp(
      title: 'Roojh',
      home: SignIn(),
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 249, 249)),
      routes: {
        // "/login": (context) => LoginPage(),
        // "/home": (context) => Home()
      }));
}
