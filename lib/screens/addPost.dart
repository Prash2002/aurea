import 'dart:io';
import 'dart:math';
import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/services.dart';

import 'package:image/image.dart' as im;
import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:save_in_gallery/save_in_gallery.dart';


class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  File image;
  File imageTwo;
  final picker = ImagePicker();
  String imagePath;
  @override
  void initState() { 
    super.initState();
    

  }
  String _imagePath;

 final _imageSaver =  ImageSaver();



   download(context)async{
      print("Inside download");
      //  Navigator.pop(context);
    final tempFile = await picker.getImage(source: ImageSource.gallery);
    print(tempFile);
    setState(() {
      image = File(tempFile.path);
    });
    print(image);
    final image1 = decodeImage(image.readAsBytesSync());
    print(image1);
    //  Navigator.pop(context);
    final temp2File = await picker.getImage(source: ImageSource.gallery);
    print(tempFile);
    setState(() {
      imageTwo = File(temp2File.path);
    });
final image2 = decodeImage(imageTwo.readAsBytesSync());
 print(image2);
final mergedImage = im.Image(image1.width + image2.width, max(image1.height, image2.height)
);
// final mergedImage = Image(image1.width + image2.width, max(image1.height, image2.height));
 print(mergedImage);
 copyInto(mergedImage, image1, blend : false);
 copyInto(mergedImage, image2, dstX:image1.width, blend:false);
 print(mergedImage);


final documentDirectory = await getExternalStorageDirectory();
final file = new File(join(documentDirectory.path, "merged_image2.jpg"));
  final finalFile = file.writeAsBytesSync(encodeJpg(mergedImage));
   print("done");


    final urls = [file.path];
    print(urls);
    List<Uint8List> bytesList = [];
  	for (final url in urls) {
		final bytes =  await rootBundle.load(url);
		bytesList.add(bytes.buffer.asUint8List());
	}
	// 3
	   final res = await _imageSaver.saveImages(
		imageBytes: bytesList,
	   );
     print(res);

  setState(() {
    imagePath = file.path;
  });
  }



  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: mat.Image.file(File(imagePath??"")
            ),
          ),
          FlatButton(
            color: Colors.red,
          onPressed: (){
             download(context);
            // getPath();
        
          }, 
          child:  Text("download"),
          )
        ],
      ),
    );
  }
}