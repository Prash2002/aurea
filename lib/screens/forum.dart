import 'package:aurea/models/post_model.dart';
import 'package:aurea/screens/posts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Forum extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
 final postsRef = Firestore.instance.collection('posts');
  @override
  Widget build(BuildContext context) {
    
  var orientation = MediaQuery.of(context).orientation;
  var width= MediaQuery.of(context).size.width;
  var height= MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          body: FutureBuilder(
            future: postsRef.getDocuments(),
            builder:  (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            if(snapshot.data.documents.length == 0){
              print('Hi');
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
            PostScreen result = PostScreen( post
                  // post.name,
                  // "Offer ends in ${offer.endDate.toDate().difference(now).inDays} Days",
                  // "assets/logo.jpg",
                  // post.photoUrl,
                  // post.startDate.toDate().toString().split(" ")[0] +
                  //     " to " +
                  //     post.endDate.toDate().toString().split(" ")[0],
                  // post.description
                  );
              results.add(result);
            });
            print(results);
            return Container(
              // color: Colors.black,
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