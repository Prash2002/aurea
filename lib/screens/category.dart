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
    return Scaffold(
          body: Container(
            color: widget.color,
            child: ListView.builder(
              scrollDirection: orientation== Orientation.portrait ?Axis.vertical :Axis.horizontal,
              
              itemCount: widget.list.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                          child: Image.asset(
                             widget.list[index].imageUrl,
                            //  height: height* 0.7,
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
    );
  }
}