import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Contact();
  }
}

class _Contact extends State<Contact> {
  String _name, _message;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _contact() async {
    final String url =
        'mailto:vincenttran.portfoliocontact@gmail.com?subject=$_name with portfolio app contact&body=$_message';
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'Could not launch mail app.';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: 'Your name'),
          validator: (String value) {
            if (value.isEmpty) return 'Your name is required.';
          },
          onSaved: (String value) => _name = value,
        ),
        TextFormField(
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Message'),
          validator: (String value) {
            if (value.isEmpty) return 'Message is required.';
          },
          onSaved: (String value) => _message = value,
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            'Submit',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            _formKey.currentState.save();
            _contact();
          },
        )
      ],
    );
  }
}
