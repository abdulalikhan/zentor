import 'package:flutter/material.dart';
import 'package:zentor/components/appBar.dart';
import 'package:zentor/components/audioPlayer.dart';

class Anxiety extends StatefulWidget {
  @override
  _AnxietyState createState() => _AnxietyState();
}

class _AnxietyState extends State<Anxiety> {
  final String mode = 'anxiety';
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
          color: Color(0xffbd4800).withOpacity(0.7),
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Appbar('Reduce Anxiety'),
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
