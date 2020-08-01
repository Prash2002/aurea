import 'dart:async';

import 'package:aurea/screens/login.dart';
import 'package:aurea/screens/swipePages.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(milliseconds: 4000), (){
      Navigator.push(context,MaterialPageRoute(builder: (context)=> SwipePages()));
    } );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage("assets/images/flower2.jpg"),
              fit:BoxFit.cover,
            ),
          ),
          child:Center(child: Text("Aurea", style: TextStyle(color: Color.fromRGBO(84, 132, 111,1),
          fontSize: 65, fontFamily: "Acme"),),)
        ),
      ),
    );
  }
}