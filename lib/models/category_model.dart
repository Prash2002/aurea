import 'package:aurea/models/example_model.dart';
import 'package:flutter/material.dart';

class ExCategory{
  String image;
  String name;
  List<Example> list;
  Color color;
  ExCategory({this.name, this.image, this.list, this.color});
}

List<ExCategory> categories = [
  ExCategory(name: 'Nature', image: 'https://i.pinimg.com/originals/cf/b3/a2/cfb3a20c45001b3dc39ffc961c4374ed.png', list: nature , color: Colors.amber),
  ExCategory(name: 'Architecture', image: 'https://image.freepik.com/free-photo/amazing-taj-mahal_122035-991.jpg', list: arch ,color: Colors.yellow ),
  ExCategory(name: 'Art', image: 'https://blog.singulart.com/wp-content/uploads/2019/08/tour_img-312981-148.jpg', list: art ,color: Colors.yellow),
  ExCategory(name: 'Human', image: 'https://golden-ratio.club/images/galleries/people/golden-ratio-nose-eyes.jpg', list: human,color: Colors.yellow ),
  ExCategory(name: 'Memes', image: 'https://golden-ratio.club/images/galleries/memes/fawcett-fibonacci-spiral-hair.jpeg', list: meme ,color: Colors.yellow),
  ExCategory(name: 'Techmology', image: 'https://golden-ratio.club/images/galleries/tech/golden-ratio-apple-logo.jpg', list: tech,color: Colors.yellow ),
];