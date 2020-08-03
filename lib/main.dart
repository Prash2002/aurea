
import 'package:aurea/screens/examples.dart';
import 'package:aurea/screens/home.dart';
import 'package:aurea/screens/login.dart';
import 'package:aurea/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aurea',
      theme: ThemeData(
        fontFamily: 'Faustina',
        primaryColor: Color.fromRGBO(56, 173, 169,1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

