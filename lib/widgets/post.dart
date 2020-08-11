import 'package:aurea/models/post_model.dart';
import 'package:aurea/screens/commentScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostScreen extends StatefulWidget {
  final Post post;
  final String currentUserId;
  PostScreen(this.post, this.currentUserId);

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
  // bool isLiked;
  @override
  void initState() {
    super.initState();
    likesCount = getLikesCount(widget.post.likes);
  }
  final CollectionReference postCollection = Firestore.instance.collection('posts');
  // bool isLiked = widget.post.likes[widget.currentUserId]??false;
  @override
  Widget build(BuildContext context) {
    bool isLiked =  widget.post.likes[widget.currentUserId]== true;
    
    handleLike(){
      bool _isLiked = widget.post.likes[widget.currentUserId]== true;
      // setState(() {
      // if(isLiked){
      //   likesCount--;
      //   isLiked = false;
      // }
      // // isLiked = !isLiked;
      // else{
      // print(isLiked);
      //   likesCount++;
      //   isLiked = true;
      // }
      // // print("liked");
      // });
      print(widget.post.likes[widget.currentUserId]);

  if(_isLiked){
    postCollection
      .document(widget.post.id)
      .updateData({
        'likes.${widget.currentUserId}' :false
      });
  //     removeLikeFromActivityFeed();
    setState(() {
      likesCount -=1;
      isLiked = false;
      // _isLiked = false;
      widget.post.likes[widget.currentUserId]= false;
      // print()

    });
  }
  else if(!_isLiked){
    postCollection
      .document(widget.post.id)
      .updateData({
        'likes.${widget.currentUserId}' :true
      });
    //   addLikeToActivityFeed();
    setState(() {
      likesCount +=1;
      isLiked = true;
      widget.post.likes[widget.currentUserId]= true;
      // showHeart = true;
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentScreen(currentUserId: widget.currentUserId, postId: widget.post.id,)));
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