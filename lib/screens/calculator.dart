import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();
  TextEditingController abController = TextEditingController();

@override
  void initState() {
   aController = TextEditingController();
   bController = TextEditingController();
   abController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    aController.dispose();
    bController.dispose();
    abController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Golden Ratio Calculator", style: TextStyle(fontFamily: 'Acme',fontSize: 25),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height:orientation==Orientation.portrait? height:height*1.4,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/calbg3.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal:10,vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width:1)
                    ),
                child: Text("Use this calculator to find values that satisfy the golden ratio (golden mean, golden section) between two elements, e.g. golden ratio rectangle or golden ratio lines."
                , style: TextStyle(fontSize: 19),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10,vertical: 0),
                child: Text("A to B is in the golden ratio proportion:"
                , style: TextStyle(fontSize: 19,),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10,vertical: 5),
                child: Text("(A+B)/A = A/B = 1.618..."
                , style: TextStyle(fontSize: 19,backgroundColor: Colors.green[100]),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
                child: Text("Change the numbers to fit your needs:"
                , style: TextStyle(fontSize: 19,),),
              ),
              SizedBox(height: 20,),
              Stack(
                children: <Widget>[
                  Container(
                    width: orientation==Orientation.portrait?width*0.95:width*0.8,
                    height: orientation==Orientation.portrait?height*0.4:height*0.6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/ratio.png"),
                        fit: BoxFit.contain
                      )
                    ),
                  ),
                  Positioned(
                    top:15,
                    left: orientation==Orientation.portrait?width*0.18:width*0.11,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: 95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                        controller: aController,
                        onChanged: (num){
                          setState(() {
                            bController.text = (double.parse(num)/1.618).toStringAsFixed(4).toString();
                            abController.text = (double.parse(num)+ double.parse(bController.text)).toStringAsFixed(4).toString();
                          });
                        },
                     
                      ),
                    ),
                  ),
                  Positioned(
                    top:15,
                    right:orientation==Orientation.portrait? width*0.1:width*0.042,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: 95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                        controller: bController,
                        onChanged: (num){
                          setState(() {
                            aController.text = (double.parse(num)*1.618).toStringAsFixed(4).toString();
                            abController.text = (double.parse(num)+ double.parse(aController.text)).toStringAsFixed(4).toString();
                          });
                        },
                        
                      ),
                    ),
                  ),
                  Positioned(
                    bottom:orientation==Orientation.portrait?10:15,
                    left: orientation==Orientation.portrait?width*0.35:width*0.5,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: 95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                        controller: abController,
                        onChanged: (num){
                          setState(() {
                            aController.text = (double.parse(num)/1.618).toStringAsFixed(4).toString();
                            bController.text = (double.parse(aController.text)/1.618).toStringAsFixed(4).toString();
                          });
                        },
                        
                        
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}