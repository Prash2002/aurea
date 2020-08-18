import 'package:aurea/models/user_model.dart';
import 'package:aurea/screens/uploadPost.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  final User currentUser;
  AddPost({this.currentUser});
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
  var orientation = MediaQuery.of(context).orientation;
  var width= MediaQuery.of(context).size.width;
  var height= MediaQuery.of(context).size.height;
    return SafeArea(
          child: Scaffold(
        body: Center(
          child: Container(
            width: width,
            height: height,
            color: Color.fromRGBO(253,237,203,1),
            child: SingleChildScrollView(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  
                  SizedBox(
                    height: height* 0.15,
                  ),
                  FlatButton(
                    onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadPost(currentUser: widget.currentUser)));
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
                borderRadius: BorderRadius.circular(50)),
                  ),
                  SizedBox(
                    height: height* 0.05,
                  ),
                  Image.asset('assets/images/upload.png',
                    height: height*0.4,
                  ),
                ],
              ),
            )
          ),
        )
      ),
    );
  }
}