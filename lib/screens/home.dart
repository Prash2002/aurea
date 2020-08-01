import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'addPost.dart';
import 'examples.dart';
import 'forum.dart';
import 'infoPage.dart';
import 'interactive.dart';

class Home extends StatefulWidget {
  final User currentUser;
  Home({this.currentUser});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  int _selectedIndex=0;

  @override
  void initState() {
    pageController = PageController(initialPage: 2);
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  onPageChanged(int _selectedIndex){
    setState(() {
      this._selectedIndex=_selectedIndex;
    });
  }

  onTap(int _selectedIndex){
    pageController.animateToPage(_selectedIndex, duration: Duration(milliseconds: 40), curve:Curves.ease);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        index:2,
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.white10,
        items: <Widget>[
          Icon(Icons.info, size: 30,color: Colors.white,),
          Icon(Icons.home, size: 30,color: Colors.white,),
          Icon(Icons.add, size: 37,color: Colors.white,),
          Icon(Icons.file_upload, size: 30,color: Colors.white,),
          Icon(Icons.forum, size: 30,color: Colors.white,),
        ],
        onTap: onTap,
       ),
       body: PageView(
         children: <Widget>[
           InfoPage(),
           ExamplePage(),
           AddPost(),
           Interactive(),
           Forum()
         ],
         controller:pageController,
         physics: NeverScrollableScrollPhysics(),
         onPageChanged: onPageChanged,
       ),
    );
  }
}
