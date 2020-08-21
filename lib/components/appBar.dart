import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  final String label;

  Appbar(this.label);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8),
            height: 60,
            child: Text(
              label,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: "Josefin",
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 20,
                    width: 20,
                    child: Image.asset(
                      "assets/images/exit.png",
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
