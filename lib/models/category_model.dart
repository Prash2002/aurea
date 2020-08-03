import 'package:aurea/models/example_model.dart';
import 'package:flutter/material.dart';

class ExCategory{
  String image;
  String name;
  List<Example> list;
  Color color;
  String bgimage;
  ExCategory({this.name, this.image, this.list, this.color, this.bgimage});
}

List<ExCategory> categories = [
  ExCategory(name: 'Nature', image: 'https://i.pinimg.com/originals/cf/b3/a2/cfb3a20c45001b3dc39ffc961c4374ed.png', list: nature , color: Colors.amber[200], bgimage: 'https://image.freepik.com/free-photo/closeup-beautiful-attractive-nature-view-green-leaf-blurred-greenery-background-garden_105035-1025.jpg'),
  ExCategory(name: 'Architecture', image: 'https://image.freepik.com/free-photo/amazing-taj-mahal_122035-991.jpg', list: arch ,color: Colors.blueGrey[300], bgimage: 'https://image.freepik.com/free-photo/red-brown-vintage-brick-wall-with-shabby-structure-horizontal-wide-brickwall-background-grungy-red-brick-blank-wall-texture-retro-house-facade-abstract-panoramic-web-banner-stonewall-surface_1253-1065.jpg'),
  ExCategory(name: 'Art', image: 'https://blog.singulart.com/wp-content/uploads/2019/08/tour_img-312981-148.jpg', list: art ,color: Colors.redAccent[100], bgimage: 'https://image.freepik.com/free-vector/dreamy-sky-with-pine-trees-watercolor-background_10126-884.jpg'),
  ExCategory(name: 'Human', image: 'https://golden-ratio.club/images/galleries/people/golden-ratio-nose-eyes.jpg', list: human,color: Colors.blue[200], bgimage: 'https://image.freepik.com/free-vector/dreamy-floral-background_53876-92903.jpg'),
  ExCategory(name: 'Memes', image: 'https://golden-ratio.club/images/galleries/memes/fawcett-fibonacci-spiral-hair.jpeg', list: meme ,color: Colors.green[200], bgimage: 'https://www.livemememaker.com/assets/templates/12.jpg'),
  ExCategory(name: 'Techmology', image: 'https://golden-ratio.club/images/galleries/tech/golden-ratio-apple-logo.jpg', list: tech,color: Colors.lime[200], bgimage: 'https://as1.ftcdn.net/jpg/02/20/76/28/500_F_220762865_x44kxk0IN1PJeJlAYXuXNcjh9hYOcdlQ.jpg'),
];