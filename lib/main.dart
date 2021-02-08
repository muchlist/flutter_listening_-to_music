import 'package:flutter/material.dart';
import 'package:flutter_listening_to_music/widget/music_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Listen to music"),
        ),
        body: const Center(
          child: MusicWidget(),
        ),
      ),
    );
  }
}
