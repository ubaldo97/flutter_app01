import 'package:flutter/material.dart';
import 'package:flutter_app01/pages/sign_up.dart';
import 'pages/login.dart';
import 'pages/sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      routes: {
        "login":(context)=>LoginPage(),
        "signup":(context)=>SignUpPage()
      },
    );
  }
}


