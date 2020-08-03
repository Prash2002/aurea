import 'package:aurea/models/example_model.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final List<Example> list;
  final Color color;
  const Category({this.list, this.color});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
  var orientation = MediaQuery.of(context).orientation;
  var width= MediaQuery.of(context).size.width;
  var height= MediaQuery.of(context).size.height;
    return SafeArea(
          child: Scaffold(
            body: Container(
              //FINAL
              // https://image.freepik.com/free-photo/sunflower-blue-sky-background-sunny-day_223622-184.jpg eww
              // https://image.freepik.com/free-photo/snow-covered-trees-against-sky_199223-1370.jpg not bad
              // https://image.freepik.com/free-vector/red-watercolor-splash-background_1035-9220.jpg
              // https://image.freepik.com/free-photo/closeup-beautiful-attractive-nature-view-green-leaf-blurred-greenery-background-garden_105035-1025.jpg
              // https://image.freepik.com/free-photo/eastern-biege-arch-mosaic-carved-architecture-classic-columns-indian-style-decorative-architectural-frame_88088-432.jpg looks great but empty in center
              // https://image.freepik.com/free-photo/decorated-wall-qutub-complex-delhi-india_163782-5296.jpg
              // color: widget.color,
              // https://image.freepik.com/free-photo/red-brown-vintage-brick-wall-with-shabby-structure-horizontal-wide-brickwall-background-grungy-red-brick-blank-wall-texture-retro-house-facade-abstract-panoramic-web-banner-stonewall-surface_1253-1065.jpg
              height: height,
               decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://as1.ftcdn.net/jpg/02/20/76/28/500_F_220762865_x44kxk0IN1PJeJlAYXuXNcjh9hYOcdlQ.jpg'),
                    fit:BoxFit.cover,
                    repeat: ImageRepeat.repeat
                  ),
                ),
              child: ListView.builder(
                scrollDirection: orientation== Orientation.portrait ?Axis.vertical :Axis.horizontal,
                
                itemCount: widget.list.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
                    child: Container(
                       color: Colors.white70,
                       child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                            child: orientation==Orientation.portrait?
                            Image.asset(
                               widget.list[index].imageUrl,
                            )
                            :Image.asset(
                               widget.list[index].imageUrl,
                               height: height* 0.7, // for landscape
                               
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text( widget.list[index].title),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                ),
        ),
      ),
    );
  }
}