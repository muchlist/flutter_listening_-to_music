import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class MusicWidget extends StatelessWidget {
  static final _asssetAudioPlayer = AssetsAudioPlayer();
  const MusicWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                icon: const Icon(Icons.open_in_browser),
                onPressed: () {
                  _asssetAudioPlayer.open(Audio("assets/audios/music.mp3"));
                }),
            StreamBuilder<Duration>(
                stream: _asssetAudioPlayer.currentPosition,
                builder: (context, AsyncSnapshot<Duration> asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    final time = asyncSnapshot.data;
                    if (time != null) {
                      return Text("${time.inMinutes}m ${time.inSeconds}s");
                    } else {
                      return const Text("no time available");
                    }
                  }
                  return const Text("0m 0s");
                }),
            StreamBuilder(
                stream: _asssetAudioPlayer.isPlaying,
                builder: (context, AsyncSnapshot<bool> isPlaying) {
                  if (isPlaying.data ?? false) {
                    return IconButton(
                        icon: const Icon(Icons.pause),
                        onPressed: () {
                          _asssetAudioPlayer.pause();
                        });
                  } else {
                    return IconButton(
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () {
                          _asssetAudioPlayer.play();
                        });
                  }
                }),
          ],
        )
      ],
    );
  }
}
