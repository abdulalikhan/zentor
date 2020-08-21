import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class playerPlugin extends StatefulWidget {
  String currUrl;
  String currLabel = 'Title';
  String mode;
  String containerBg;
  playerPlugin({Key key, this.mode}) : super(key: key);
  @override
  _playerPluginState createState() => _playerPluginState();
}

class _playerPluginState extends State<playerPlugin> {
  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();
  bool playing = false;

  @override
  void initState() {
    super.initState();
    if (widget.mode == 'anxiety') {
      setState(() {
        widget.currUrl =
            'https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Anxiety%2FOvercoming%20Fear%20%26%20Anxiety.mp3?alt=media&token=bd9fa7fc-eb7c-4502-bba4-288309ff1b7d';
        widget.currLabel = 'Overcoming Fear & Anxiety';
        widget.containerBg = 'coltri';
      });
    } else if (widget.mode == 'sleep') {
      widget.currUrl =
          'https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Sleep%2FPrepare%20for%20Rest.mp3?alt=media&token=100a6410-fe15-4c45-af42-bb9994d3fd6c';
      widget.currLabel = 'Prepare for Rest';
      widget.containerBg = 'colmoon';
    } else if (widget.mode == 'abundance') {
      widget.currUrl =
          'https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Abundance%2FAttract%20Abundance%20%26%20Prosperity.mp3?alt=media&token=3eadf4a1-dbb8-49aa-b0b9-49d8666bf77f';
      widget.currLabel = 'Attract Abundance & Prosperity';
      widget.containerBg = 'colcir';
    } else if (widget.mode == 'awareness') {
      widget.currUrl =
          'https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Self-Awareness%2FSelf%20Awareness.mp3?alt=media&token=4fd3887f-0588-450d-a632-35ddb4f7753f';
      widget.currLabel = 'Self-Awareness';
      widget.containerBg = 'coldrop';
    }
    getAudio(widget.currUrl);
  }

  @override
  void dispose() {
    audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/${widget.containerBg}.png"),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.currLabel,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Josefin",
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      slider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            position.inMinutes.toString().padLeft(2, '0') +
                                ":" +
                                (position.inSeconds - (position.inMinutes * 60))
                                    .toString()
                                    .padLeft(2, '0'),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            duration.inMinutes.toString().padLeft(2, '0') +
                                ":" +
                                (duration.inSeconds - (duration.inMinutes * 60))
                                    .toString()
                                    .padLeft(2, '0'),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          getAudio(widget.currUrl);
                        },
                        child: Icon(
                          playing == false
                              ? Icons.play_circle_outline
                              : Icons.pause_circle_outline,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: showList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget audioTile(String label, String newUrl) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(
        Icons.music_note,
        color: Colors.white,
      ),
      onTap: () {
        setState(() {
          widget.currUrl = newUrl;
          widget.currLabel = label;
          getAudio(newUrl);
        });
      },
    );
  }

  Widget showList() {
    if (widget.mode == 'anxiety') {
      return ListView(
        children: <Widget>[
          audioTile("Overcoming Fear & Anxiety",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Anxiety%2FOvercoming%20Fear%20%26%20Anxiety.mp3?alt=media&token=bd9fa7fc-eb7c-4502-bba4-288309ff1b7d"),
          audioTile("Meditation for Chronic Anxiety",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Anxiety%2FMeditation%20for%20Chronic%20Anxiety.mp3?alt=media&token=0ed9997e-c141-4a7b-8a08-3e492bfcebb5"),
          audioTile("Conquer Social Anxiety",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Anxiety%2FConquer%20Social%20Anxiety.mp3?alt=media&token=57e9778d-5bc4-48cb-ac31-6508ebdb54f8"),
          audioTile("Quick Anxiety Reduction",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Anxiety%2FQuick%20Anxiety%20Reduction.mp3?alt=media&token=3e4c4bab-ef05-40b9-aab3-450766a44969"),
          audioTile("Stop Overthinking",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Anxiety%2FStop%20Overthinking.mp3?alt=media&token=9713de90-ecfe-4e4f-9347-d08831980124"),
        ],
      );
    } else if (widget.mode == 'awareness') {
      return ListView(
        children: <Widget>[
          audioTile("Self-Awareness",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Self-Awareness%2FSelf%20Awareness.mp3?alt=media&token=4fd3887f-0588-450d-a632-35ddb4f7753f"),
          audioTile("Clear your Mind",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Self-Awareness%2FClear%20your%20Mind.mp3?alt=media&token=0814d59a-6137-48eb-b2db-60b4f0b96845"),
          audioTile("Quick Mindfulness Meditation",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Self-Awareness%2FQuick%20Mindfulness%20Meditation.mp3?alt=media&token=b6bca4cf-4d6c-4b3a-96a3-da0a7598347f"),
          audioTile("Self-Compassion",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Self-Awareness%2FSelf-Compassion.mp3?alt=media&token=9122f2d2-87bc-4715-984c-8cd8ea770f6f"),
          audioTile("Letting Go",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Self-Awareness%2FLetting%20Go.mp3?alt=media&token=19c5336d-9172-4b7d-9d4d-eb096d9fe5ab"),
        ],
      );
    } else if (widget.mode == 'sleep') {
      return ListView(
        children: <Widget>[
          audioTile("Prepare for Rest",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Sleep%2FPrepare%20for%20Rest.mp3?alt=media&token=100a6410-fe15-4c45-af42-bb9994d3fd6c"),
          audioTile("Meditation for Deep Sleep",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Sleep%2FMeditation%20for%20Deep%20Sleep.mp3?alt=media&token=8fc154ff-f1ac-46d8-856e-72c25b8eb1b4"),
          audioTile("Fall Asleep Fast",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Sleep%2FFall%20Asleep%20Fast.mp3?alt=media&token=908a6871-1879-4c3c-95a4-998cf6788ef6"),
          audioTile("Deep Breathing Exercises For Relaxation, Stress, Sleep",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Sleep%2FDeep%20Breathing%20Exercises%20For%20Relaxation%2C%20Stress%2C%20Sleep.mp3?alt=media&token=660fe138-682e-4bdf-b6de-c7062f43feee"),
          audioTile("Modern Breathing Relaxation Exercise",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Sleep%2FModern%20Breathing%20Relaxation%20Exercise.mp3?alt=media&token=94be8603-767e-4464-9baa-3eb1faa6abdb"),
        ],
      );
    } else if (widget.mode == 'abundance') {
      return ListView(
        children: <Widget>[
          audioTile("Attract Abundance & Prosperity",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Abundance%2FAttract%20Abundance%20%26%20Prosperity.mp3?alt=media&token=3eadf4a1-dbb8-49aa-b0b9-49d8666bf77f"),
          audioTile("Attract Wealth & Prosperity",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Abundance%2FAttract%20Wealth%20%26%20Prosperity.mp3?alt=media&token=b9c98db3-ca32-4fea-a276-354064b97018"),
          audioTile("Boost Confidence & Self-Esteem",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Abundance%2FBoost%20Confidence%20%26%20Self-Esteem.mp3?alt=media&token=7d99cbcd-72f4-4d84-9e7d-cdd6adc6b4ce"),
          audioTile("Manifesting Abundance with Gratitude",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Abundance%2FManifesting%20Abundance%20with%20Gratitude.mp3?alt=media&token=88ca1df1-ac57-40ab-bcb7-9f4e6e49e24d"),
          audioTile("Positivity & Abundance",
              "https://firebasestorage.googleapis.com/v0/b/zentor-27787.appspot.com/o/Abundance%2FPositivity%20%26%20Abundance.mp3?alt=media&token=bee8e118-1e6e-4b68-981e-5f338487ad2d"),
        ],
      );
    }
  }

  Widget slider() {
    return Slider.adaptive(
      activeColor: Colors.white,
      min: 0.0,
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          audioPlayer.seek(new Duration(seconds: value.toInt()));
        });
      },
    );
  }

  void getAudio(String url) async {
    // by default, playing is false
    if (playing) {
      // pause audio
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      // play audio
      var res = await audioPlayer.play(url, isLocal: true);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((Duration d) {
      setState(() {
        position = d;
      });
    });
  }
}
