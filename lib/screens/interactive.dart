import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:aurea/screens/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:image/image.dart';
// import 'package:image/image.dart';
import 'package:image_downloader/image_downloader.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:save_in_gallery/save_in_gallery.dart';

class Interactive extends StatefulWidget {
   Offset initPos;
  @override
  _InteractiveState createState() => _InteractiveState();
}

class _InteractiveState extends State<Interactive> with AutomaticKeepAliveClientMixin<Interactive> {
  File image;
  final picker = ImagePicker();
  
  Future imageGallery(context) async {
    Navigator.pop(context);
    final tempFile = await picker.getImage(source: ImageSource.gallery);
    print(tempFile);
    setState(() {
      image = File(tempFile.path);
    });
    print(image);
  }

  Future imageCamera(context) async {
    Navigator.pop(context);
    final tempFile = await picker.getImage(source: ImageSource.camera);
    print(tempFile);
    setState(() {
      image = File(tempFile.path);
    });
    print(image);
  }

  var top = 0.0;
  var left = 0.0;

  upload(mainContext){
    return showDialog(
      context: mainContext,
      builder: (context){
        return SimpleDialog(
          title: Text("Upload Image", textAlign: TextAlign.center,),
          children: <Widget>[
            SimpleDialogOption(
              padding: EdgeInsets.all(0),
              child:FlatButton.icon(
                onPressed: ()=>imageCamera(context),
                icon: Icon(Icons.camera_alt), 
                padding: EdgeInsets.all(0),
                label: Text("Photo with Camera", style: TextStyle(fontSize: 17),)),
            ),
            SimpleDialogOption(
              padding: EdgeInsets.all(0),
               child:FlatButton.icon(
                 padding: EdgeInsets.all(0),
                onPressed: ()=>imageGallery(context),
                icon: Icon(Icons.image), 
                label: Text("Image from Gallery", style: TextStyle(fontSize: 17),)),
            ),
            SimpleDialogOption(
              padding: EdgeInsets.all(0),
              child:FlatButton.icon(
                padding: EdgeInsets.all(0),
                onPressed:()=>Navigator.pop(context) ,
                icon: Icon(Icons.cancel), 
                label: Text("Cancel", style: TextStyle(fontSize: 17),)),
            )
          ],
        );
      }
      );
  }

  final _imageSaver =  ImageSaver();

  Future downloadImage()async{
    print("inside");
    // if(image==null){
    //   print("its null");
    // //   return ;
    // // }

    // final image1 = decodeImage(File('imageA.jpg').readAsBytesSync());
    // final image2 = decodeImage(File('imageB.jpg').readAsBytesSync());
    // // final mergedImage = Image(image1.width + image2.width, max(image1.height, image2.height));
    // final mergedImage = Image.asset("assets/imahes");
    // // copyInto(mergedImage, image1, blend = false);
    // // copyInto(mergedImage, image2, dstx = image1.width, blend = false);

    // final documentDirectory = await getApplicationDocumentsDirectory();
    // final file = new File(join(documentDirectory.path, "merged_image.jpg"));
    // file.writeAsBytesSync(encodeJpg(mergedImage));

  //   final urls = ["image"];
  //   print(urls);
  //   List<Uint8List> bytesList = [];
  // 	for (final url in urls) {
	// 	final bytes =  await rootBundle.load(url);
	// 	bytesList.add(bytes.buffer.asUint8List());
	// }
	// // 3
	//    final res = await _imageSaver.saveImages(
	// 	imageBytes: bytesList
	//    );
  //    print(res);

    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // final String path = appDocDir.path;

    // final filename = basename(image.path);
    // final File localImage = await image.copy('$path/$filename');
    // print(localImage);
    // print(path);
    
    
    
//     try {
//   // Saved with this method.
//   var imageId = await ImageDownloader.downloadImage(image.path);
//   if (imageId == null) {
//     return;
//   }

//   // Below is a method of obtaining saved image information.
//   var fileName = await ImageDownloader.findName(imageId);
//   var path = await ImageDownloader.findPath(imageId);
//   var size = await ImageDownloader.findByteSize(imageId);
//   var mimeType = await ImageDownloader.findMimeType(imageId);
//   print(fileName);
// } on PlatformException catch (error) {
//   print(error);
// }
  }
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    // return Scaffold(
    //   body: Container(
    //     height: height,
    //     width: width,
    //     child: Stack(
    //       // mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //     //     AspectRatio(
    //     //       aspectRatio: 1/1.6,
    //     //       // color: Colors.red[100],
    //     //       // height: height*0.5,
    //     //       // width: width*0.7,
    //     //       // child: image == null? Text("No file"):
    //     //      child: Positioned(
    //     //         left: position.dx,
    //     //         top:position.dy,
    //     //             child: Draggable<AssetImage>(
    //     //               data: apple,
    //     //               // child: ClipRect(
    //     //               // child: PhotoView(
    //     //               // imageProvider: FileImage(image),
    //     //               // minScale: PhotoViewComputedScale.contained * 0.8,
    //     //               // maxScale: PhotoViewComputedScale.contained * 2,
    //     //               // enableRotation: true,
    //     //               // loadingBuilder: (context,event){
    //     //               //   return CircularProgressIndicator();
    //     //               // },
    //     //               // backgroundDecoration: BoxDecoration(
    //     //               //   color: Colors.green
    //     //               // ),
    //     //               // ),
    //     //               // ),
    //     //                child: Container(
    //     //   width: 50.0,
    //     //   height: 50.0,
    //     //   decoration: BoxDecoration(
    //     //     image: DecorationImage(
    //     //       image: _imageToShow,
    //     //     ),
    //     //   ),
    //     //   child: Center(
    //     //     child: Text(
    //     //       "Apple",
    //     //       style: TextStyle(
    //     //         color: Colors.black,
    //     //         decoration: TextDecoration.none,
    //     //         fontSize: 18.0,
    //     //       ),
    //     //     ),
    //     //   ),
    //     // ),
    //     //              onDraggableCanceled: (velocity, offset){
    //     //                setState(() {
    //     //                  position = widget.initPos;
    //     //                });
    //     //              },
    //     //              onDragStarted: () {
    //     //   setState(() {
    //     //     print('drag started');
    //     //     _imageToShow = new AssetImage('assets/images/answered_apple.png');
    //     //     return _imageToShow;
    //     //   });
    //     // },
    //     // feedback: Container(
    //     //   width: 60.0,
    //     //   height: 60.0,
    //     //   decoration: BoxDecoration(
    //     //     image: DecorationImage(
    //     //       image: _imageToShow,
    //     //     ),
    //     //   ),
    //     //   child: Center(
    //     //     child: Text(
    //     //       "Apple",
    //     //       style: TextStyle(
    //     //         color: Colors.black,
    //     //         decoration: TextDecoration.none,
    //     //         fontSize: 16.0,
    //     //       ),
    //     //     ),
    //     //   ),
    //     // ),
    //     //             ),
    //     //       )
    //     //     ),
    //         Center(
    //           child: Container(
    //             height: height*0.6,
    //             width: width*0.8,
    //             color: Colors.red[100],
    //             child: GestureDetector(
    //               child: Stack(
    //                 children: <Widget>[
    //                   Positioned(
    //                     top:top,
    //                     left: left,
    //                     child: Center(
    //                       child: Container(
    //                         width: 50,
    //                         height: 50,
    //                         decoration: BoxDecoration(
    //                           shape: BoxShape.circle,
    //                           color: Colors.blue
    //                         ),
    //                       )),
    //                   ),
    //                 ],
    //               ),
    //               onVerticalDragUpdate: (DragUpdateDetails dd){
    //                 print(dd);
    //                 setState(() {
    //                   if(dd.localPosition.dy>=0 && dd.localPosition.dy<=height*0.6-50){
    //                  top = dd.localPosition.dy;
    //                   }
    //                   if(dd.localPosition.dx>=0 && dd.localPosition.dx<=width*0.8-50){
    //                 left = dd.localPosition.dx; 
    //                   }
    //                 });
                    
    //               },
    //             ),
    //           ),
    //         ),
    //         Align(
    //           alignment: Alignment.bottomCenter,
    //             child: FlatButton(
    //             color: Colors.green[200],
    //             onPressed: ()=>getImage(), 
    //             child: Text("Select Image")),
    //         )
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                height: height*0.12,
                width: width,
                decoration: BoxDecoration(
                  image:DecorationImage(
                    image: AssetImage("assets/images/gen1.jpg"),
                    fit: BoxFit.cover
                  ),
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text:TextSpan(
                      children: [
                         TextSpan(text: "Golden Ratio Generator\n",
                         style: TextStyle(
                         fontFamily: "Acme",
                         color: Colors.white,
                         fontSize: height*0.05
                       ),),
                        TextSpan(text: "(Identify golden ratio in an image) ",
                         style: TextStyle(
                         fontFamily: "Acme",
                         color: Colors.white,
                         fontSize: height*0.027
                       ),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height:height*0.015),
              Container(
                padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal:10),
                decoration: BoxDecoration(
                  border: Border.all(width:1)
                  ),
                child: Text("Upload an image and check the proportions with a fibonacci golden spiral overlay 🌀",
                style: TextStyle(
                    fontSize: height*0.027
                    ),
                ),
              ),
              SizedBox(height:40),
              Container(
                width:height*0.3*1.618,
                height: height*0.3,
                child: GestureDetector(
                    child: Card(
                    color: Colors.white,
                    child: image==null? Container():
                    Stack(
                      children: <Widget>[
                        Container(
                          width:height*0.3*1.618,
                          height: height*0.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(image),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          top:top,
                          left: left,
                          child: Container(
                            height: height*0.3,
                            width: height*0.3*1.618,
                            child: ClipRect(
                            child: PhotoView(
                            imageProvider: AssetImage("assets/images/spiral-2-hor.png"),
                            minScale: PhotoViewComputedScale.contained * 0.5,
                            maxScale: PhotoViewComputedScale.contained * 1.5,
                            enableRotation: true,
                            loadingBuilder: (context,event){
                              return CircularProgressIndicator();
                            },
                            backgroundDecoration: BoxDecoration(
                              color: Colors.transparent
                            ),
                            ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //   onVerticalDragUpdate: (DragUpdateDetails dd){
                  //   print(dd);
                  //   setState(() {
                  //     if(dd.localPosition.dy>=0 && dd.localPosition.dy<=height*0.3 -70){
                  //      top = dd.localPosition.dy;
                  //     }
                  //     if(dd.localPosition.dx>=0 && dd.localPosition.dx<=height*0.3*1.618 -70){
                  //      left = dd.localPosition.dx; 
                  //     }
                  //   });
                  //  },
                ),
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton.icon
                  (onPressed:()=>downloadImage(), 
                  color: Color.fromRGBO(118, 110, 125,1),
                  padding: EdgeInsets.symmetric(vertical:15,horizontal:6),
                  icon: Icon(Icons.file_download, size:20, color:Colors.white), 
                  label: Text("Download Image", style:TextStyle(fontSize: 17, color: Colors.white))
                  ),
                  FlatButton.icon
                  (onPressed:()=> upload(context), 
                  color: Color.fromRGBO(226, 103, 67,1),
                  padding: EdgeInsets.symmetric(vertical:15,horizontal:15),
                  icon: Icon(Icons.file_upload, size:20, color:Colors.white), 
                  label: Text("Upload Image", style:TextStyle(fontSize: 17 ,color: Colors.white))
                  )
              ],),
              SizedBox(height: 20,),
              GestureDetector(
                child: Text("Use Golden Ratio Calculator",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.indigo,
                  decoration: TextDecoration.underline
                ),
                ),
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Calculator())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}