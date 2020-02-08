import 'package:flutter/material.dart';
import 'package:flutter_sample_app/screens/home_tab_screen.dart';
import 'screens/audio_player_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeTab(),
    );
  }
}
