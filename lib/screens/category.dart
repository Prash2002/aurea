import 'package:aurea/models/example_model.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final List<Example> list;

  const Category({this.list});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            child: ListView.builder(
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