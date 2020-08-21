import 'package:flutter/material.dart';
import 'package:zentor/components/appBar.dart';
import 'package:zentor/components/audioPlayer.dart';

class Sleep extends StatefulWidget {
  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  final String mode = 'sleep';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Color(0xff6b4da3).withOpacity(0.5),
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Appbar('Better Sleep'),
                  playerPlugin(
                    mode: mode,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
