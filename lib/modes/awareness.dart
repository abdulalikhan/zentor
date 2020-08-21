import 'package:flutter/material.dart';
import 'package:zentor/components/appBar.dart';
import 'package:zentor/components/audioPlayer.dart';

class Awareness extends StatefulWidget {
  @override
  _AwarenessState createState() => _AwarenessState();
}

class _AwarenessState extends State<Awareness> {
  final String mode = 'awareness';
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
          color: Color(0xff2e6824).withOpacity(0.5),
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Appbar('Become Self-Aware'),
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
