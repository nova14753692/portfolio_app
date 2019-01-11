import 'package:flutter/material.dart';

class Divider extends StatelessWidget {
  final Color color;
  final double width;

  Divider({this.color: Colors.black, this.width: 3});

  Widget buildDivider() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: color, width: width, style: BorderStyle.solid),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildDivider();
  }
}
