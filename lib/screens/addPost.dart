import 'package:aurea/models/user_model.dart';
import 'package:aurea/screens/login.dart';
import 'package:aurea/screens/uploadPost.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  final User currentUser;
  AddPost({this.currentUser});
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  logout(BuildContext context) async {
    await googleSignIn.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
  @override
  Widget build(BuildContext context) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right:5),
                        child: PopupMenuButton(
                          icon: Icon(Icons.more_horiz,size:30,color: Theme.of(context).primaryColor,),
                          itemBuilder: (context) => [
                          PopupMenuItem(
                          child: FlatButton.icon(
                          label:Text("Logout",style:TextStyle(fontSize:16,color: Colors.black87)),
                          icon:Icon(Icons.exit_to_app,size:20),
                          onPressed: ()=>logout(context)
                        ),                      
                ),
                          PopupMenuItem(
                            child: FlatButton.icon(
                            label:Text("Cancel",style:TextStyle(fontSize:16,color: Colors.black87)),
                            icon:Icon(Icons.cancel,size:20),
                            onPressed: ()=>Navigator.pop(context)    
                            ),
                          ),
                          ],
                          ),
                      ),
                    ],
                  ),
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