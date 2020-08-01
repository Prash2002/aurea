import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class InfoVideos extends StatefulWidget {
  @override
  _InfoVideosState createState() => _InfoVideosState();
}

class _InfoVideosState extends State<InfoVideos> {
  List<String> urls = [
    "https://www.youtube.com/watch?v=5zosU6XTgSY",
    "https://www.youtube.com/watch?v=c8ccsE_IumM",
    "https://www.youtube.com/watch?v=sj8Sg8qnjOg&t=211s",
    "https://www.youtube.com/watch?v=keLN89CWZ-A",
    // "https://www.youtube.com/watch?v=SjSHVDfXHQ4",
    "https://www.youtube.com/watch?v=6nSfJEDZ_WM"
  ];
  List<String> infoVideos = [];

  @override
  void initState() {
    infoVideos = urls.map((url)=>YoutubePlayer.convertUrlToId(url)).toList();
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    final List<YoutubePlayerController> _controllers = 
      infoVideos.map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("The Golden Ratio", style: TextStyle(fontSize: 30,fontFamily: "Acme"),),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:20,horizontal:15),
          child: ListView.separated(
           scrollDirection: Axis.vertical,
            itemBuilder: (context, int index){
              
            return YoutubePlayer(
            key: ObjectKey(_controllers[index]),
            controller: _controllers[index],
            actionsPadding: EdgeInsets.only(left: 16.0),
            bottomActions: [
              CurrentPosition(),
              SizedBox(width: 10.0),
              ProgressBar(isExpanded: true),
              SizedBox(width: 10.0),
              RemainingDuration(),
              FullScreenButton(),
            ],
          );
            },
             itemCount: _controllers.length,
             separatorBuilder: (context, _) => SizedBox(height: 25.0),
            ),
        )
        ),
    );
  }
}