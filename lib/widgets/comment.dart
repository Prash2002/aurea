import 'package:aurea/models/comment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class EachComment extends StatefulWidget {
  final Comment comment;
  final String currentUserId;
  EachComment(this.comment, this.currentUserId);

  @override
  _EachCommentState createState() => _EachCommentState();
}

class _EachCommentState extends State<EachComment> {


   int getLikesCount(likes){
    if(likes == null) {
      return 0;
    }
    int count =0;
    likes.values.forEach((val){
      if (val== true){
        count +=1;
      }
    });
    return count;
   }
  int likesCount ;
  @override
  void initState() {
    super.initState();
    likesCount = getLikesCount(widget.comment.likes);
  }
  @override
  Widget build(BuildContext context) {
  final CollectionReference commentCollection = Firestore.instance.collection('posts').document(widget.comment.postId).collection('comments');
    bool isLiked =  widget.comment.likes[widget.currentUserId]== true;
    
    handleLike(){
      bool _isLiked = widget.comment.likes[widget.currentUserId]== true;
      if(_isLiked){
        commentCollection
      .document(widget.comment.commentId)
      .updateData({
        'likes.${widget.currentUserId}' :false
      });
    setState(() {
      likesCount -=1;
      isLiked = false;
      widget.comment.likes[widget.currentUserId]= false;

    });
  }
  else if(!_isLiked){
    commentCollection
      .document(widget.comment.commentId)
      .updateData({
        'likes.${widget.currentUserId}' :true
      });
    setState(() {
      likesCount +=1;
      isLiked = true;
      widget.comment.likes[widget.currentUserId]= true;
    });

    }}
    return Container(
      color: Colors.white54,
        child: Row(
           children: <Widget>[
          CircleAvatar(
                  backgroundImage: NetworkImage(widget.comment.userPhoto),
                  radius: 25,
                ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text(
                   widget.comment.username,
                   style: TextStyle(
                     fontWeight: FontWeight.w600,
                     fontSize: 17.0
                   ),
                 ),
                Text(
                  timeago.format(widget.comment.timestamp.toDate()),
                  style: TextStyle(
                    color: Colors.grey,
                     fontSize: 14.0
                   ),
                ),  
                Text(
                  widget.comment.comment,
                  style: TextStyle(
                    color: Colors.grey[800],
                     fontSize: 14.0
                   ),
                  ),
                ],
                     ),
            ),
                 ),
               Column(
                  children: <Widget>[
                    IconButton(
                    icon: Icon(
                      isLiked? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () => handleLike()
            ),
            
            Text(likesCount.toString(),
              style: TextStyle(
                  fontSize: 14.0,
              ),
            ),
                  ],
              ),
            ] ),
    );
  }
}