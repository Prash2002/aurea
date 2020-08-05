import 'dart:async';
import 'package:aurea/models/user_model.dart';
import 'package:aurea/screens/home.dart';
import 'package:flutter/material.dart';

class UploadPost extends StatefulWidget {
  final User currentUser;
  UploadPost({this.currentUser});
  @override
  _UploadPostState createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost> {
  final _key = GlobalKey<FormState>();
  final skey = GlobalKey<ScaffoldState>();
  String caption = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    // var orientation = MediaQuery.of(context).orientation;
    // var width= MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;
    return Scaffold(
      key: skey,
      appBar: AppBar(
        title: Text('Upload Post'),
        centerTitle: true,
      ),
        body: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height*0.025,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 8.0),
              child: TextFormField(
                // autovalidate: true,
                decoration: InputDecoration(
                  labelText: "Enter Caption",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(
                      ),
                    ),
                ),
                 onChanged: (cap){
                  setState((){
                    caption = cap;
                    print(caption);
                  });
                },
                validator: (val){
                  if(val.isEmpty){
                    return 'Enter a Caption';
                  }
                  else return null;
                },
              ),
            ),
            SizedBox(
              height: height*0.025,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Description",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(
                      ),
                    ),
                ),
                onChanged: (cap){
                  setState((){
                    description = cap;
                    print(description);
                  });
                },
                maxLines: 7 ,
              ),
            ),
            SizedBox(
              height: height*0.025,
            ),
            FlatButton(
              onPressed: (){
                if(_key.currentState.validate()){
                  _key.currentState.save();
                  SnackBar snackbar = SnackBar(content: Text('Post Uploaded :)'),);
                  skey.currentState.showSnackBar(snackbar);
                  Timer(Duration(seconds: 5),(){
                    // print('posted');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(currentUser: widget.currentUser)));
                  });
                }

              },
              color: Color.fromRGBO(56, 173, 169,1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:18.0, vertical: 8.0),
                child: Text(
                  'Post'.toUpperCase(),
                  style: TextStyle(
                    // color:Color.fromRGBO(253,237,203,1),
                    fontSize: 22.0
                  ),
                ),
              ),
              shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)),
            ),
            
          ],
        ),
      ),
    );
  }
}