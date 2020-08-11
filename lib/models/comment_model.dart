import 'package:cloud_firestore/cloud_firestore.dart';

class Comment{
  String postId;
  String comment;
  String commentId;
  // String imageUrl;
  String username;
  String userPhoto;
  String userId;
  Timestamp timestamp;
  Map likes;
  int likesCount;

  Comment({
    this.comment ,
    this.likes,
    this.postId ,
    this.commentId,
    // this.imageUrl ,
    this.username,
    this.userPhoto,
    this.userId,
    this.timestamp,
    this.likesCount
  });
  
   factory Comment.fromDocument(DocumentSnapshot doc){
     return Comment(
       comment: doc['comment'],
       postId: doc['postId'],
      //  imageUrl: doc['imageUrl'],
       username: doc['username'],
       userPhoto: doc['userPhoto'],
       userId: doc['userId'],
       timestamp: doc['timestamp'],
       likes: doc['likes'],
       commentId: doc['commentId']
     );
   }
   addDocument(Comment comment) async {
     final CollectionReference commentCollection = Firestore.instance.collection('posts').document(postId).collection('comments');
     await commentCollection
      // .document(post.ownerId).collection('userPost')
      .document(comment.commentId).setData({
      "commentId":comment.commentId,
      "comment" : comment.comment,
      "postId": comment.postId,
      // "imageUrl": post.imageUrl,
      "userId": comment.userId,
      "username" : comment.username,
      "userPhoto": comment.userPhoto,
      "timestamp": comment.timestamp,
      "likes" : {}
   } );
   }
}