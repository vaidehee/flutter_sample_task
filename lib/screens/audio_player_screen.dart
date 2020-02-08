import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/models/practice.dart';

class AudioPlayerScreen extends StatefulWidget {
  String title;
  Practice practice;

  AudioPlayerScreen({this.title, this.practice});

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
    audioCache.play('audio2.mp3');
  }

  @override
  void dispose() {
    super.dispose();
    advancedPlayer.stop();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  Widget slider() {
    return Slider(
        activeColor: Colors.white,
        inactiveColor: Colors.black,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  margin: EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.close)))
        ],
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
              fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Color(0xFF2E4CB9),
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0.0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70.0,
                    alignment: Alignment.center,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 25.0,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                            ),
                            child: (IconButton(
                              onPressed: () {
                                /* if(advancedPlayer.state==AudioPlayerState.PAUSED)
                                        {
                                            audioCache.play;
                                            advancedPlayer.state==AudioPlayerState.PLAYING;

                                        }
                                      else if(advancedPlayer.state==AudioPlayerState.PLAYING)
                                        {
                                          advancedPlayer.pause();
                                          advancedPlayer.state==AudioPlayerState.PAUSED;
                                        }
                                    ;*/
                              },
                              icon: Icon(
                                advancedPlayer.state == AudioPlayerState.PAUSED
                                    ? Icons.play_arrow
                                    : Icons.pause,
                                //Icons.pause,
                                color: Colors.white,
                                size: 25.0,
                              ),
                            )),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.tune,
                              color: Colors.white,
                              size: 25.0,
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30.0),
                    width: MediaQuery.of(context).size.width,
                    child: slider(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
