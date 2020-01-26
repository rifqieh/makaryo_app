import 'dart:async';

import 'package:flutter/material.dart';
import 'package:makaryo_mobile/color.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    );

    // kalo pake asset
    // _conctroller = VideoPlayerController.asset('');

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: primaryColor,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Container(
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return CircularProgressIndicator(
                      backgroundColor: backgroundColor,
                    );
                  }
                },
              ),
            ),
            ListTile(
              isThreeLine: true,
              title: Text(
                'Judul Video',
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(
                'Diunggah tanggal x',
                style: Theme.of(context).textTheme.subtitle,
              ),
              trailing: IconButton(
                icon: Icon(Icons.favorite_border),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "x2",
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
