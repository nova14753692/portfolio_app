import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  final String aboutMeText;

  AboutMe(this.aboutMeText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Image.asset('assets/hexagon.png'),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Who is this guy?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          aboutMeText,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
