import 'package:flutter/material.dart';

class GenButton extends StatelessWidget {
  final String title;
  GenButton(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right:10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(98, 128, 139,1),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Text(title, style: TextStyle(color: Colors.white,fontFamily: 'Acme',),),
      ),
    );
  }
}