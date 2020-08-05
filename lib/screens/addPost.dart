import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    
  var orientation = MediaQuery.of(context).orientation;
  var width= MediaQuery.of(context).size.width;
  var height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(253,237,203,1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: (){
                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));
              },
              color: Color.fromRGBO(56, 173, 169,1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Upload Image'.toUpperCase(),
                  style: TextStyle(
                    color:Color.fromRGBO(253,237,203,1),
                    fontSize: 32.0
                  ),
                ),
              ),
              shape:RoundedRectangleBorder(
          //       side: BorderSide(
          //   color: Colors.blue,
          //   width: 1,
          //   style: BorderStyle.solid
          // ), 
          borderRadius: BorderRadius.circular(50)),
            ),
            SizedBox(
              height: height* 0.05,
            ),
            Image.asset('assets/images/upload.png'),
          ],
        )
      )
    );
  }
}