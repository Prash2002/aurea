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
      
      print(widget.comment.likes[widget.currentUserId]);
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
    return Padding(
        padding: const EdgeInsets.all(18.0),
      child: Container(
        color: Colors.white54,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                isThreeLine: true,
                leading: CircleAvatar(
                        backgroundImage: NetworkImage(widget.comment.userPhoto),
                        radius: 25,
                      ),
                title: Column(
                  children: <Widget>[
                    Text(
                       widget.comment.username,
                      ),
                       Text(
                    timeago.format(widget.comment.timestamp.toDate())
                    ),
                  ],
                ),
                  subtitle: Text(
                    // timeago.format(widget.comment.timestamp.toDate())
                    widget.comment.comment,
                    ),
                    trailing:  Column(
                      children: <Widget>[
                        IconButton(
                        icon: Icon(
                          isLiked? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () => handleLike()
                  ),
                  
                  Text(likesCount.toString()),
                      ],
                    ), 
              ),
              ],
        ),
      ),
    );
  }
}