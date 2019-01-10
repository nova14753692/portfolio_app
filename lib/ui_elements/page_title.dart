import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String _title;
  final Color color;

  PageTitle(this._title, [this.color = Colors.black]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.redAccent, width: 3),
            ),
          ),
          child: Text(
            _title,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
