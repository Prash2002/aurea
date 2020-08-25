import 'dart:async';
import 'dart:io';
import 'package:aurea/models/post_model.dart';
import 'package:aurea/models/user_model.dart';
import 'package:aurea/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

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
  File _image;
  String imageUrl;
  String postId = Uuid().v4();
  bool isUploading = false;


Future<String> uploadFile(File imageFile) async {
      StorageReference storageReference =
          FirebaseStorage.instance.ref().child('offer/$postId');
      StorageUploadTask uploadTask = storageReference.putFile(imageFile);
      await uploadTask.onComplete;
      String downloadUrl = await storageReference.getDownloadURL();
      return downloadUrl;
    }


  chooseFromGallery() async{
      final PickedFile file = await ImagePicker().getImage(
        source: ImageSource.gallery,
        );
        setState((){
          _image = File(file.path);
        });
  }
  chooseFromCamera() async {
    final PickedFile file = await ImagePicker().getImage(
        source: ImageSource.camera,
        );
        setState((){
          _image = File(file.path);
        });
  }

  handleSubmit() async {
                  if(_image==null){
                    SnackBar snackbar = SnackBar(content: Text('Please choose an image'),);
                    skey.currentState.showSnackBar(snackbar);
                  }
                  else if(_key.currentState.validate()) {
                    _key.currentState.save();
                    setState(() {
                      isUploading = true;
                    });

                     imageUrl = await uploadFile(_image);
                    Post post = Post(
                      id: postId,
                      caption : caption,
                      ownerId : widget.currentUser.id,
                      username: widget.currentUser.name,
                      userPhoto: widget.currentUser.photoUrl,
                      timestamp: Timestamp.fromDate(DateTime.now()),
                      imageUrl: imageUrl,
                    );
                    await Post().addDocument(post);
                    setState(() {
                      isUploading = false;
                      postId = Uuid().v4();
                    });

                    SnackBar snackbar = SnackBar(content: Text('Post Uploaded!!'),);
                    skey.currentState.showSnackBar(snackbar);
                    Timer(Duration(seconds: 5),(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(currentUser: widget.currentUser)));
                    });
                  }

  }

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return Scaffold(
      key: skey,
      appBar: AppBar(
        title: Text('Upload Post'),
        centerTitle: true,
      ),
        body: SingleChildScrollView(
                  child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height*0.025,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 8.0),
                child: TextFormField(
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
              _image!=null? 
              Image.file(
                _image,
                // height: height*0.5,
              )
              :
              Row(
                
            mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () => chooseFromGallery(), 
                    label: Text('Choose From Gallery'),
                    icon: Icon(Icons.photo_library)
                    ),
                FlatButton.icon(
                onPressed: () => chooseFromCamera(), 
                label: Text('Create an Image'),
                icon: Icon(Icons.photo_camera)
                ),
                ],
              ),
              SizedBox(
                height: height*0.025,
              ),
              FlatButton(
                onPressed:  isUploading? null : () => handleSubmit(),
                color: Color.fromRGBO(56, 173, 169,1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:18.0, vertical: 8.0),
                  child: Text(
                    'Post'.toUpperCase(),
                    style: TextStyle(
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
        ),
    );
  }
}