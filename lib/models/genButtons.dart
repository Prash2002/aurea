import 'package:flutter/material.dart';

class GenButton extends StatelessWidget {
  final String title;
  GenButton(this.title);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    return Container(
      height: orientation==Orientation.portrait? height*0.052:height*0.11,
      width: orientation==Orientation.portrait?width*0.28:width*0.16,
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