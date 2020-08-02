import 'package:aurea/models/example_model.dart';

class ExCategory{
  String image;
  String name;
  List<Example> list;
  ExCategory({this.name, this.image, this.list});
}

List<ExCategory> categories = [
  ExCategory(name: 'Nature', image: 'https://i.pinimg.com/originals/cf/b3/a2/cfb3a20c45001b3dc39ffc961c4374ed.png', list: nature ),
  ExCategory(name: 'Architure', image: 'https://image.freepik.com/free-photo/amazing-taj-mahal_122035-991.jpg', list: arch ),
  ExCategory(name: 'Art', image: 'https://image.freepik.com/free-photo/lisa-mona-artwork-painting-oil-art_121-67506.jpg', list: art ),
  ExCategory(name: 'Human', image: 'https://golden-ratio.club/images/galleries/people/golden-ratio-nose-eyes.jpg', list: human ),
  ExCategory(name: 'Memes', image: 'https://golden-ratio.club/images/galleries/memes/fawcett-fibonacci-spiral-hair.jpeg', list: meme ),
  ExCategory(name: 'Techmology', image: 'https://golden-ratio.club/images/galleries/tech/golden-ratio-apple-logo.jpg', list: tech ),
];