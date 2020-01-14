import 'package:makaryo_mobile/color.dart';
import 'package:makaryo_mobile/screens/category-list-admin-screen.dart';
import 'chewie-list-item.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:makaryo_mobile/screens/article-screen.dart';
import 'package:makaryo_mobile/screens/category-screen.dart';
import 'package:makaryo_mobile/screens/login-screen.dart';
import 'package:makaryo_mobile/screens/register-screen.dart';
import 'package:makaryo_mobile/screens/video-player-app.dart';
import 'package:provider/provider.dart';
import 'screens/home-screen.dart';
import 'providers/theme-changer.dart';
import 'screens/home-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(
        ThemeData(
          primaryColor: primaryColor,
          backgroundColor: backgroundColor,
          cardTheme: CardTheme(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 2,
          ),
        ),
      ),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      home: HomeScreen(),
      theme: theme.getTheme(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: ListView(
        children: <Widget>[
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'videos/IntroVideo.mp4',
            ),
            looping: true,
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            ),
          ),
          ChewieListItem(
            // This URL doesn't exist - will display an error
            videoPlayerController: VideoPlayerController.network(
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/error.mp4',
            ),
          ),
        ],
      ),
    );
  }
}
