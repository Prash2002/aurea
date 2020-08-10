import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  String id;
  String caption;
  String description;
  String imageUrl;
  String username;
  String userPhoto;
  String ownerId;
  Timestamp timestamp;
  // Map likes;

  Post({
    this.caption ,
    // this.description ,
    this.id,
    this.imageUrl ,
    this.username,
    this.userPhoto,
    this.ownerId,
    this.timestamp,
  });
  
  final CollectionReference postCollection = Firestore.instance.collection('posts');

   factory Post.fromDocument(DocumentSnapshot doc){
     return Post(
       caption: doc['caption'],
      //  description: doc['description'],
       imageUrl: doc['imageUrl'],
       username: doc['username'],
       userPhoto: doc['userPhoto'],
       ownerId: doc['ownerId'],
       timestamp: doc['timestamp'],
      //  id: doc['id']
     );
   }
   addDocument(Post post) async {
     await postCollection
      // .document(post.ownerId).collection('userPost')
      .document(post.id).setData({
      "id":post.id,
      "caption" : post.caption,
      // "description": post.description,
      "imageUrl": post.imageUrl,
      "username" : post.username,
      "userPhoto": post.userPhoto,
      "timestamp": post.timestamp,
      "likes" : {}
   } );
   }
}