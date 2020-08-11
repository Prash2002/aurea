import 'package:aurea/models/comment_model.dart';
import 'package:aurea/models/user_model.dart';
import 'package:aurea/widgets/comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CommentScreen extends StatefulWidget {
  final User currentUser;
  final String postId;
  CommentScreen({this.currentUser, this.postId});
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  String newComment='';
  String commentId = Uuid().v4();
  bool isUploading = false;


  @override
  Widget build(BuildContext context) {
  var orientation = MediaQuery.of(context).orientation;
  var width= MediaQuery.of(context).size.width;
  var height= MediaQuery.of(context).size.height;
  final CollectionReference commentCollection = Firestore.instance.collection('posts').document(widget.postId).collection('comments');
  handleComment() async {
    //TODO: 
    setState(() {
     isUploading = true;
    });
    print("going to upload");
    Comment comment = Comment(
      commentId: commentId,
      comment: newComment,
      postId: widget.postId,
      username: widget.currentUser.name,
      userId: widget.currentUser.id,
      userPhoto: widget.currentUser.photoUrl,
      timestamp: Timestamp.fromDate(DateTime.now())
      );
    await Comment().addDocument(
      comment
    );
    print("uploaded");
    setState(() {
      isUploading = false;
      commentId = Uuid().v4();
      newComment = "";
   });
    print("commented");
  }
    return Scaffold(
      appBar: AppBar(
        title: Text('comments')
      ),
          body: Column(
        children: <Widget>[
          Expanded(
              child: StreamBuilder(
                stream: commentCollection.orderBy('timestamp').snapshots(),
                builder: (context, snapshot){
                  if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }
                      if(snapshot.data.documents.length == 0){
                        print('Hi');
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('No comments yet',
                              style: TextStyle(
                                // color: Colors.pink[600],
                                fontSize: 35.0,
                              ),
                            ),
                            Image.network(
                              'https://image.freepik.com/free-vector/reviews-concept-landing-page_52683-18921.jpg',
                                  height: height*0.4,
                                ),
                          ],
                        );
                        }
                      List<EachComment> results = [];
                      snapshot.data.documents.forEach((doc) {
                        Comment comment = Comment.fromDocument(doc);
                      EachComment result = EachComment( comment, widget.currentUser.id );
                        results.add(result);
                      });
                      print(results);
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                        // color: Colors.black,
                        child: ListView(
                          children: results,
                        ),
                      );

                },
              ),
          ),
           Divider(),
              ListTile(
                title: TextField(
                   decoration: InputDecoration(
                      labelText: "Enter Comment",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                          ),
                        ),
                    ),
                  onChanged: (value) {
                    setState((){
                      newComment = value;
                    });
                  },
                ),
                trailing: isUploading?
                CircularProgressIndicator()
                :IconButton(
                icon: Icon(Icons.send),
                onPressed: () => handleComment(),
              ),
              ),
        ],
      ),
    );
  }
}