import 'package:aurea/models/post_model.dart';
import 'package:aurea/models/user_model.dart';
import 'package:aurea/widgets/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Forum extends StatefulWidget {
  final User currentUser;
  Forum({this.currentUser});
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
 final postsRef = Firestore.instance.collection('posts');
  @override
  Widget build(BuildContext context) {
    
  var height= MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          body: FutureBuilder(
            future: postsRef.getDocuments(),
            builder:  (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            if(snapshot.data.documents.length == 0){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('No posts yet',
                    style: TextStyle(
                      color: Colors.pink[600],
                      fontSize: 35.0,
                    ),
                  ),
                  Image.asset('assets/images/forum.png',
                        height: height*0.4,
                      ),
                ],
              );
            }
            List<PostScreen> results = [];
            snapshot.data.documents.forEach((doc) {
              Post post = Post.fromDocument(doc);
            PostScreen result = PostScreen( post, widget.currentUser );
              results.add(result);
            });
            return Container(
              child: ListView(
                children: results,
              ),
            );
            }
            ),
        
      ),
    );
  }
}