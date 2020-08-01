import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              orientation==Orientation.portrait?Column(
              children:<Widget>[
              Image.asset("assets/images/parrot.jpg",
              height: height*0.57,
              width: width,
              fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(top:10),
                height: height*0.27,
                width: width*0.93,
                child: Column(
                  children: <Widget>[
                    Text("The Golden Ratio",style: TextStyle(
                                fontSize: height*0.05,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Acme',
                                color: Colors.pink[600]
                              ),),
                    Text("The Golden ratio is a special irrational number like pi (π) represented as phi, Φ. Its value is 1.61803398874989484820...\nGolden ratio has its applications in all aspects of nature, art, finance, and much more.",
                    style: TextStyle(fontSize: height*0.027),
                    )
                ],),
              ),
              ],
              ):
              Row(
              children:<Widget>[
              Image.asset("assets/images/parrot.jpg",
              height: height*0.7,
              width: width*0.29,
              fit: BoxFit.contain,
              ),
              SizedBox(width: 20,),
              Container(
                margin: EdgeInsets.only(top:10),
                height: height*0.6,
                width: width*0.67,
                
                child: Column(
                  children: <Widget>[
                    Text("The Golden Ratio",style: TextStyle(
                                fontSize: height*0.1,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Acme',
                                color: Colors.pink[600]
                              ),),
                    Text("The Golden ratio is a special irrational number like pi (π) represented as phi, Φ. Its value is 1.61803398874989484820...\nGolden ratio has its applications in all aspects of nature, art, finance, and much more.",
                    style: TextStyle(fontSize: height*0.053),
                    )
                ],),
              ),
              ],
              ),
              SizedBox(height: 200,)
            ],
          ),
        ),
      ),
    );
  }
}