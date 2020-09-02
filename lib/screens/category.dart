import 'package:aurea/models/example_model.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final List<Example> list;
  final String bgimage;
  const Category({this.list, this.bgimage});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
  var orientation = MediaQuery.of(context).orientation;
  var height= MediaQuery.of(context).size.height;
    return SafeArea(
          child: Scaffold(
            body: Container(
              height: height,
               decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.bgimage,
                      ),
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
                               height: height* 0.7, 
                               
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