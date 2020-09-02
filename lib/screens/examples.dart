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
    height: height*0.9,
    child: FlatButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(list: item.list, bgimage: item.bgimage)));
      },
      child: Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              item.image, 
              fit: BoxFit.cover, 
              width:width,
              // height: height * 0.7,
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

Widget widget1 = ListView.builder(
                  scrollDirection:Axis.vertical,
                  physics: orientation==Orientation.portrait?NeverScrollableScrollPhysics(): AlwaysScrollableScrollPhysics() , //for landscape comment this

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
                    );
List<Widget> widget = [
                 Container(
                   height: orientation==Orientation.portrait?height*0.3:height*0.7,
                   child: CarouselSlider(
                        items: imageSliders,
                        options: CarouselOptions(
                          scrollDirection:  orientation==Orientation.portrait?Axis.horizontal:Axis.vertical,
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
                  
];
    return SafeArea(
        child: Scaffold(
         body:orientation==Orientation.portrait? SingleChildScrollView(
                    child: Column(children: <Widget>[
            Container(
                     width: width,
                      decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://image.freepik.com/free-vector/stylish-hexagonal-line-pattern-background_1017-19742.jpg'),
                        repeat: ImageRepeat.repeat
                      ),
                    ),child:Column(
                       children: widget
               
             ),
                   ),
                   Container(
                     width: width,
                      decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://image.freepik.com/free-vector/stylish-hexagonal-line-pattern-background_1017-19742.jpg'),
                        repeat: ImageRepeat.repeat
                      ),
                    ),child: widget1
                   ),
           ],),
         ):
             Row(
               children: <Widget>[
                 Container(
                   width: width*0.5,
                    height: height,
                    decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://image.freepik.com/free-vector/stylish-hexagonal-line-pattern-background_1017-19742.jpg'),
                      repeat: ImageRepeat.repeat
                    ),
                  ), 
                  child: SingleChildScrollView(
                 child: Column(
                   children: widget
             
           ),
          ),
                 ),
                 Container(
                   width: width*0.5,
                    height: height,
                    decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://image.freepik.com/free-vector/stylish-hexagonal-line-pattern-background_1017-19742.jpg'),
                       repeat: ImageRepeat.repeat
                    ),
                  ),
                   child: widget1
                 ),
               ],
             ),
      ),
    );
  }
}

