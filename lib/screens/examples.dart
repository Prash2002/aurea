import 'package:aurea/models/category_model.dart';
import 'package:aurea/models/example_model.dart';
import 'package:aurea/screens/category.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  int _current = 0;
  
  @override
  Widget build(BuildContext context) {
  var width= MediaQuery.of(context).size.width;
  var orientation = MediaQuery.of(context).orientation;
  var height= MediaQuery.of(context).size.height;
  final List<Widget> imageSliders = categories.map((item) => Container(
  child: FlatButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(list: item.list, color: item.color,)));
      },
      child: Container(
        
              // width:width,
              // height: height * 0.4,
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              item.image, 
              fit: BoxFit.cover, 
              width:width,
              height: height * 0.4,
              ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  item.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    ),
  ),
)).toList();


    return SafeArea(
        child: Scaffold(
         body: 
         SingleChildScrollView(
             child: Container(
              //  https://image.freepik.com/free-vector/stylish-hexagonal-line-pattern-background_1017-19742.jpg
              //  https://image.freepik.com/free-vector/vintage-ornamental-flowers-background_52683-28040.jpg
                decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://image.freepik.com/free-vector/stylish-hexagonal-line-pattern-background_1017-19742.jpg'),
                  // fit:BoxFit.fitWidth,
                  repeat: ImageRepeat.repeat
                ),
              ),
              //  color: Colors.black,
               child: Column(
               children: <Widget>[
                 SizedBox(
                   height: height* 0.07,
                 ),
                 CarouselSlider(
                      items: imageSliders,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: categories.map((url) {
                        int index = categories.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                              ? Color.fromRGBO(0, 0, 0, 0.9)
                              : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  Wrap(
                    children: <Widget>[
                      ListView.builder(
                      scrollDirection: orientation== Orientation.portrait ?Axis.vertical :Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: all.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
                          child: Card(
                            // color: Colors.white70,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                                  child:
                                   Container(
                                     child: Image.asset(
                                       all[index].imageUrl,
                                      //  width: width* 0.2,
                                      // height: height*0.2,
                                       fit: BoxFit.cover,
                                  ),
                                ),),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text( all[index].title),
                                ),
                              ],
                            ),
                          ),
                         );
                         }
                        )
                     ],
                  ),
               ],
           ),
             ),
         ),
      ),
    );
  }
}