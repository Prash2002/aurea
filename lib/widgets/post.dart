import 'package:aurea/models/post_model.dart';
import 'package:aurea/models/user_model.dart';
import 'package:aurea/screens/commentScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostScreen extends StatefulWidget {
  final Post post;
  final User currentUser;
  PostScreen(this.post, this.currentUser);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {


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
    likesCount = getLikesCount(widget.post.likes);
  }
  final CollectionReference postCollection = Firestore.instance.collection('posts');
  @override
  Widget build(BuildContext context) {
    bool isLiked =  widget.post.likes[widget.currentUser.id]== true;
    
    handleLike(){
      bool _isLiked = widget.post.likes[widget.currentUser.id]== true;
      

  if(_isLiked){
    postCollection
      .document(widget.post.id)
      .updateData({
        'likes.${widget.currentUser.id}' :false
      });setState(() {
      likesCount -=1;
      isLiked = false;
      widget.post.likes[widget.currentUser.id]= false;
      
    });
  }
  else if(!_isLiked){
    postCollection
      .document(widget.post.id)
      .updateData({
        'likes.${widget.currentUser.id}' :true
      });
    setState(() {
      likesCount +=1;
      isLiked = true;
      widget.post.likes[widget.currentUser.id]= true;
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
                leading: CircleAvatar(
                        backgroundImage: NetworkImage(widget.post.userPhoto),
                        radius: 25,
                      ),
                title: Text(
                   widget.post.username,
                  ),
                  subtitle: Text(
                    timeago.format(widget.post.timestamp.toDate())
                    ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.post.caption,
                     style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                ),
              ),
              Image.network(widget.post.imageUrl),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      isLiked? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () => handleLike()
                  ),
                  Text(likesCount.toString()),
                  IconButton(
                    icon: Icon(Icons.comment,
                      color: Colors.grey[700],
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentScreen(currentUser: widget.currentUser, postId: widget.post.id,)));
                    },
                  ),
                ],
              ),
            ],
        ),
      ),
    );
  }
}