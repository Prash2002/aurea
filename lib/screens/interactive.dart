//merge properly
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:aurea/models/genButtons.dart';
import 'package:aurea/screens/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image/image.dart';
import 'package:image/image.dart' as im;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:save_in_gallery/save_in_gallery.dart';

class Interactive extends StatefulWidget {
  @override
  _InteractiveState createState() => _InteractiveState();
}

class _InteractiveState extends State<Interactive> with AutomaticKeepAliveClientMixin<Interactive> {
  File image;
  final picker = ImagePicker();
  PhotoViewController photoViewController;
  String spiralName ="spiral-2-hor.png";
  bool leftSpiral = true;
  bool black = true;
  @override
  void initState() { 
    super.initState();
    photoViewController = PhotoViewController();
  }

  @override
  void dispose() { 
    photoViewController.dispose();
    super.dispose();
  }
  
  Future imageGallery(context) async {
    Navigator.pop(context);
    final tempFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(tempFile.path);
    });
  }

  Future imageCamera(context) async {
    Navigator.pop(context);
    final tempFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      image = File(tempFile.path);
    });
  }

  axisFlip(){
    setState(() {
      leftSpiral = !leftSpiral;
    if(!leftSpiral && black)
     spiralName = "spiral-2.png";
     else if(leftSpiral && black) 
     spiralName = "spiral-2-hor.png";
     else if(!leftSpiral && !black) 
     spiralName = "red-spiral-right-hor.png";
     else if(leftSpiral && !black) 
     spiralName = "red-spiral-left-hor.png";
    });
  }

  reset(){
    setState(() {
      image = null;
    });
  }

  invertColor(){
    setState(() {
      black = !black;
      if(!black && leftSpiral)
      spiralName = "red-spiral-left-hor.png";
      else if(!black && !leftSpiral)
      spiralName= "red-spiral-right-hor.png";
      else if(black && leftSpiral)
      spiralName= "spiral-2-hor.png";
      else if(black && !leftSpiral)
      spiralName= "spiral-2.png";
    });
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

   getImageFileFromAssets(String path) async {

  final filename = path;
ByteData imageData = await rootBundle.load("assets/images/$filename");
 List<int>bytes = Uint8List.view(imageData.buffer);
String dir = (await getApplicationDocumentsDirectory()).path;
 final File file = File('$dir/$filename');
 File('$dir/$filename').writeAsBytesSync(bytes);

return file;
  } 

  final _imageSaver =  ImageSaver();

  Future downloadImage(context) async{

    if(image==null){
      return ;
    }
    var orientation = MediaQuery.of(context).orientation;
    double scale = photoViewController.scale;
    Offset offset = photoViewController.rotationFocusPoint;
    double rotate = photoViewController.rotation;
    
    final image1 = decodeImage(image.readAsBytesSync());
    
    final file = await getImageFileFromAssets(spiralName);
    final tempImage = decodeImage(file.readAsBytesSync());
    im.Image image3 = orientation==Orientation.portrait?
     copyResize(tempImage, width: (tempImage.width * (scale/0.21)).toInt() ,height: (tempImage.height* (scale/0.21)).toInt())
     :copyResize(tempImage, width: (tempImage.width * (scale/0.28)).toInt() ,height: (tempImage.height* (scale/0.28)).toInt());
    im.Image image2 = copyRotate(image3, rotate*180/3.14);

    final mergedImage = im.Image(image1.width,image1.height);
    // var dX = image1.width/2;
    // var dY = image1.height/2;
    var dX = (image1.width - image2.width)/2 ;
    var dY = (image1.height - image2.height )/2 ;
  
    copyInto(mergedImage, image1, blend : true);
    copyInto(mergedImage, image2, dstX: dX.toInt(), dstY:dY.toInt(),srcX: 0, srcY: 0, blend:true);

    final documentDirectory = await getExternalStorageDirectory();
 
    final mergedfilename = new File(join(documentDirectory.path, "merged_image.jpg"));

    final finalFile = mergedfilename.writeAsBytesSync(encodeJpg(mergedImage));

    final urls = [mergedfilename.path];
    List<Uint8List> bytesList = [];
  	for (final url in urls) {
		final bytes =  await rootBundle.load(url);
		bytesList.add(bytes.buffer.asUint8List());
	}

	   final res = await _imageSaver.saveImages(
		imageBytes: bytesList,
	   );
     if(res){
       Fluttertoast.showToast(
        msg: "Image Downloaded",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[300],
        textColor: Colors.white,
        fontSize: 14.0
      );
     }
    //  else{
    //     Fluttertoast.showToast(
    //     msg: "Couldn't download",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.brown[300],
    //     textColor: Colors.white,
    //     fontSize: 16.0
    //   );
    //  } 
  print(res);
 
  }

  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
  
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                height: orientation==Orientation.portrait? height*0.12: height*0.26,
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
                         fontSize: orientation==Orientation.portrait? height*0.025:height*0.1,
                       ),),
                        TextSpan(text: "(Identify golden ratio in an image) ",
                         style: TextStyle(
                         fontFamily: "Acme",
                         color: Colors.white,
                         fontSize:orientation==Orientation.portrait? height*0.015:height*0.06,
                       ),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: orientation==Orientation.portrait? height*0.015:height*0.05),
              Container(
                padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal:10),
                decoration: BoxDecoration(
                  border: Border.all(width:1)
                  ),
                child: Text("Upload an image and check the proportions with a fibonacci golden spiral overlay 🌀",
                style: TextStyle(
                    fontSize:orientation==Orientation.portrait? height*0.027:height*0.05,
                    ),
                ),
              ),
              SizedBox(height:20),
              Container(
                width:orientation==Orientation.portrait? height*0.3*1.618: height*0.72*1.618,
                height:orientation==Orientation.portrait?  height*0.3: height*0.72,
                child: GestureDetector(
                    child: Card(
                    color: Colors.white,
                    child: image==null? Container():
                    Stack(
                      children: <Widget>[
                        Container(
                          width:orientation==Orientation.portrait? height*0.3*1.618: height*0.72*1.618,
                          height:orientation==Orientation.portrait?  height*0.3:height*0.72,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(image),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          top:0,
                          left: 0,
                          child: Container(
                            height: orientation==Orientation.portrait? height*0.3: height*0.72,
                            width:orientation==Orientation.portrait?  height*0.3*1.618: height*0.72*1.618,
                            child: ClipRect(
                            child: PhotoView(
                            controller: photoViewController,
                            imageProvider: AssetImage("assets/images/$spiralName"),
                            minScale: PhotoViewComputedScale.contained * 0.3,
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
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: GenButton("Flip Axis"),
                    onTap: ()=>axisFlip(),
                  ),
                  GestureDetector(
                    child: GenButton("Invert Color"),
                    onTap: ()=>invertColor(),
                  ),
                  GestureDetector(
                    child: GenButton("Reset"),
                    onTap: ()=>reset(),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment:orientation==Orientation.portrait? MainAxisAlignment.spaceAround: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton.icon
                  (onPressed:()=>downloadImage(context), 
                  color: mat.Color.fromRGBO(118, 110, 125,1),
                  padding: orientation==Orientation.portrait?EdgeInsets.symmetric(vertical:15,horizontal:6):EdgeInsets.symmetric(vertical:15,horizontal:10),
                  icon: Icon(Icons.file_download, size:20, color:Colors.white), 
                  label: Text("Download Image", style:TextStyle(fontSize: 17, color: Colors.white))
                  ),
                  FlatButton.icon
                  (onPressed:()=> upload(context), 
                  color: mat.Color.fromRGBO(226, 103, 67,1),
                  padding: orientation==Orientation.portrait?EdgeInsets.symmetric(vertical:15,horizontal:15):EdgeInsets.symmetric(vertical:15,horizontal:18),
                  icon: Icon(Icons.file_upload, size:20, color:Colors.white), 
                  label: Text("Upload Image", style:TextStyle(fontSize: 17 ,color: Colors.white))
                  )
              ],),
              SizedBox(height: 15,),
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
              SizedBox(height: orientation==Orientation.portrait?5:20,)
            ],
          ),
        ),
      ),
    );
  }
}

