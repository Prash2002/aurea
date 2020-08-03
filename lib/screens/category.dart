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
              // https://image.freepik.com/free-photo/three-sunflowers-blue-wooden-background_23-2147874348.jpg
              //  https://image.freepik.com/free-photo/high-angle-view-beautiful-sunflowers-yellow-surface_23-2147926997.jpg
              // https://image.freepik.com/free-photo/high-angle-view-sunflowers-dual-colorful-background_23-2147927048.jpg not nice
              // https://cdn130.picsart.com/290988115007201.jpg?type=webp&to=min&r=640 too crowdy
              //  https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/sunflower-pattern-on-blue-background-maryana-kankulova.jpg eww
              // https://www.womenslivesleeds.org.uk/wp-content/uploads/2018/01/anxiety-leeds.jpg ewwww
              // https://images.assetsdelivery.com/compings_v2/photoplotnikov/photoplotnikov1705/photoplotnikov170500003.jpg not bad
              // https://previews.123rf.com/images/haidishabrina/haidishabrina1711/haidishabrina171100024/89635507-the-modern-sunflower-vector-pattern-is-using-minimalist-design-style-it-represent-cute-modern-clean-.jpg watermark
              // https://image.freepik.com/free-photo/pattern-daysies-yellow-background-with-space-left_24972-210.jpg cool
              // https://image.freepik.com/free-photo/white-chamomile-flowers-yellow-background_4740-3108.jpg good not satisfied
              // https://newevolutiondesigns.com/images/freebies/yellow-wallpaper-1.jpg no
              // https://ctl.s6img.com/society6/img/nS2tioSeTZNiorLujCno0Yb7Jbc/w_700/comforters/swatch/~artwork,fw_6000,fh_6000,iw_6000,ih_6000/s6-original-art-uploads/society6/uploads/misc/1b994293daef455e9b9afd8e0325b5e7/~~/small-white-polka-dots-with-yellow-background-comforters.jpg too bright
              //  https://wallpaperaccess.com/full/1548252.jpg not seen
              //  https://i.pinimg.com/736x/7e/bf/c0/7ebfc03902a1c7eca22e2e94b8ce93c2.jpg too plain

              // TODAY
              // https://image.freepik.com/free-photo/yellow-sunflowers-pink_91769-188.jpg eww af
              //https://png.pngtree.com/thumb_back/fh260/background/20190223/ourmid/pngtree-pure-color-watercolor-graffiti-gradient-background-board-design-board-design-image_66713.jpg okayish
              // https://previews.123rf.com/images/tampatra/tampatra1805/tampatra180500100/101683800-circuit-board-on-white-background-high-tech-technology-background-texture-pattern-abstract-illustrat.jpg ewwww


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
                      // https://cdn.pixabay.com/photo/2020/06/19/10/21/sunflower-lace-background-5316805__340.jpg eww
                      // https://image.freepik.com/free-photo/sunflower-blank-white-paper-yellow-background_23-2147874347.jpg
                      color: Colors.white70,
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     image: NetworkImage('https://image.freepik.com/free-photo/sunflower-blank-white-paper-yellow-background_23-2147874347.jpg'),
                      //     fit:BoxFit.fitHeight,
                      //     // repeat: ImageRepeat.repeat
                      //   ),
                      // ),
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
                               height: height* 0.7, // works for landscape
                               
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