import 'package:flutter/material.dart';
import '../models/user_model.dart';

class Home extends StatefulWidget {
  final User currentUser;
  Home({this.currentUser});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
       
      ),
    );
  }
}