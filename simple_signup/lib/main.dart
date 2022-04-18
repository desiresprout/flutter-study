import 'package:flutter/material.dart';
import 'package:simple_signup/screens/initScreen.dart';
import 'package:simple_signup/screens/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: InitScreen(),
      home: LoginScreen(),
    );
  }
}
