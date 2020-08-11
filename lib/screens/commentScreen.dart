import 'package:aurea/models/comment_model.dart';
import 'package:aurea/models/user_model.dart';
import 'package:aurea/widgets/comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  final String currentUserId;
  final String postId;
  CommentScreen({this.currentUserId, this.postId});
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  String newComment='';

  handleComment(){
    //TODO: 
  }

  @override
  Widget build(BuildContext context) {
  var orientation = MediaQuery.of(context).orientation;
  var width= MediaQuery.of(context).size.width;
  var height= MediaQuery.of(context).size.height;
  final CollectionReference commentCollection = Firestore.instance.collection('posts').document(widget.postId).collection('comments');
    return Column(
      children: <Widget>[
        SingleChildScrollView(
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
                            color: Colors.pink[600],
                            fontSize: 35.0,
                          ),
                        ),
                        // Image.asset('assets/images/forum.png',
                        //       height: height*0.4,
                        //     ),
                      ],
                    );
                    }
                  List<EachComment> results = [];
                  snapshot.data.documents.forEach((doc) {
                    Comment comment = Comment.fromDocument(doc);
                  EachComment result = EachComment( comment, widget.currentUserId );
                    results.add(result);
                  });
                  print(results);
                  return Container(
                    // color: Colors.black,
                    child: ListView(
                      children: results,
                    ),
                  );

            },
          ),
        ),
        Row(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState((){
                  newComment = value;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => handleComment(),
            )
          ],
        )
      ],
    );
  }
}