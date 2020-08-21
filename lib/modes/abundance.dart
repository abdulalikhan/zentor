import 'package:flutter/material.dart';
import 'package:zentor/components/appBar.dart';
import 'package:zentor/components/audioPlayer.dart';

class Abundance extends StatefulWidget {
  @override
  _AbundanceState createState() => _AbundanceState();
}

class _AbundanceState extends State<Abundance> {
  final String mode = 'abundance';
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
          color: Color(0xff000080).withOpacity(0.5),
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Appbar('Attract Abundance'),
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
