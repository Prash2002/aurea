import 'package:aurea/models/user_model.dart';

class Post{
  String caption;
  String description;
  String imageUrl;
  User user;
  Post({
    this.caption ,
    this.description ,
    this.imageUrl ,
    this.user,
  });
}