import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video_page extends StatefulWidget {
  String video;
  String Name;

  Video_page({Key? key, required this.video, required this.Name})
      : super(key: key);

  @override
  State<Video_page> createState() => _Video_pageState();
}

class _Video_pageState extends State<Video_page> {
  VideoPlayerController? Myvideo;
  late ChewieController Mychewiecontroller;

  @override
  void initState() {
    super.initState();
    Myvideo = VideoPlayerController.asset(widget.video)
      ..initialize().then((value) => setState(() {}));
    Mychewiecontroller = ChewieController(
        videoPlayerController: Myvideo!,
        aspectRatio: 4 / 2,
        autoPlay: false,
        allowFullScreen: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Myvideo!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.Name,
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 4 / 2,
            child: Chewie(
              controller: Mychewiecontroller,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
