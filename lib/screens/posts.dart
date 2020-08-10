import 'package:aurea/models/post_model.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  final Post post;

  PostScreen(this.post);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.post.userPhoto),
                radius: 25,
              ),
        title: Text(
           widget.post.username,
          //  style:
          //   TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
          ),
      ),
    );
  }
}