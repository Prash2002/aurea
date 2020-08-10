import 'package:aurea/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostScreen extends StatefulWidget {
  final Post post;

  PostScreen(this.post);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
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
                    icon: Icon(Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(Icons.comment,
                      color: Colors.grey[700],
                    ),
                    onPressed: (){},
                  ),
                ],
              ),
            ],
        ),
      ),
    );
  }
}