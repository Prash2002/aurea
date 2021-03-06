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
  final skey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
  final CollectionReference commentCollection = Firestore.instance.collection('posts').document(widget.postId).collection('comments');
  handleComment() async {
    if(newComment.trim().length ==0 ){
      SnackBar snackbar = SnackBar(content: Text('Please type a comment'),);
      skey.currentState.showSnackBar(snackbar);
    }
    else{
      setState(() {
     isUploading = true;
    });
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
    setState(() {
      isUploading = false;
      commentId = Uuid().v4();
   });
  }
  }
  
    return Scaffold(
      key: skey,
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
                        return Center(child: CircularProgressIndicator());
                      }
                      if(snapshot.data.documents.length == 0){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('No comments yet',
                              style: TextStyle(
                                fontSize: 35.0,
                              ),
                            ),
                            Image.network(
                              'https://image.freepik.com/free-vector/reviews-concept-landing-page_52683-18921.jpg',
                                  // height: height*0.4,
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
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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