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


  // compressImage() async {
  //     final tempDir = await getTemporaryDirectory();
  //     final path = tempDir.path;
  //     imageLib.Image image = imageLib.decodeImage(imageFile.readAsBytesSync());
  //     var compressedImage = File('$path/img_$postId.jpg')..writeAsBytesSync(imageLib.encodeJpg(image, quality: 85));
  //   }
Future<String> uploadFile(File imageFile) async {
      StorageReference storageReference =
          FirebaseStorage.instance.ref().child('offer/$postId');
      StorageUploadTask uploadTask = storageReference.putFile(imageFile);
      await uploadTask.onComplete;
      print('File Uploaded');
      String downloadUrl = await storageReference.getDownloadURL();
      return downloadUrl;
    }


  chooseFromGallery() async{
    // File file = await ImagePicker.pickImage(
      // source: ImageSource.gallery,
      // ) ;
      final PickedFile file = await ImagePicker().getImage(
        source: ImageSource.gallery,
        );
        setState((){
          _image = File(file.path);
        });
  }

  handleSubmit() async {
                  if(_image==null){
                    print('Bitch! Image');
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
                      // ID is googleId and not authentication id
                      ownerId : widget.currentUser.id,
                      username: widget.currentUser.name,
                      userPhoto: widget.currentUser.photoUrl,
                      timestamp: Timestamp.fromDate(DateTime.now()),
                      imageUrl: imageUrl,
                    );
                    await Post().addDocument(post);
                    print(post.ownerId);
                    setState(() {
                      isUploading = false;
                      postId = Uuid().v4();
                    });

                    SnackBar snackbar = SnackBar(content: Text('Post Uploaded :)'),);
                    skey.currentState.showSnackBar(snackbar);
                    Timer(Duration(seconds: 5),(){
                      // print('posted');
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(currentUser: widget.currentUser)));
                    });
                  }

  }

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
              _image!=null? 
              Image.file(
                _image,
              )
              :
              FlatButton.icon(
                onPressed: () => chooseFromGallery(), 
                label: Text('Choose From Gallery'),
                icon: Icon(Icons.photo_library)
                ),
                FlatButton.icon(
                onPressed: () => null, 
                label: Text('Create an Image'),
                icon: Icon(Icons.photo_camera)
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