import 'package:flutter/material.dart';
import 'package:my_video_player/utils/video_utils.dart';
import 'package:my_video_player/views/screens/my_video_page.dart';

void main() {
  runApp(const MyVideo_Player());
}

class MyVideo_Player extends StatefulWidget {
  const MyVideo_Player({Key? key}) : super(key: key);

  @override
  State<MyVideo_Player> createState() => _MyVideo_PlayerState();
}

class _MyVideo_PlayerState extends State<MyVideo_Player> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "Video Player",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: Videolist.map(
                  (e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Video_page(
                            Name: e['Vname'],
                            video: e['Video'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 200,
                      width: 330,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        image: DecorationImage(
                            image: AssetImage(
                              e['VImage'],
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.play_circle_filled,
                        color: Colors.white.withOpacity(0.7),
                        size: 50,
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
