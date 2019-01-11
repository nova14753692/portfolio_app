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
  final FocusNode _messageFocusNode = FocusNode();

  void _contact() async {
    final String url =
        'mailto:vincenttran.portfoliocontact@gmail.com?subject=$_name with portfolio app contact&body=$_message';
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'Could not launch mail app.';
  }

  Widget _buildNameTextFormField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: 'Your name'),
      style: TextStyle(color: Colors.redAccent, fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) return 'Your name is required.';
      },
      onSaved: (String value) => _name = value,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_messageFocusNode),
    );
  }

  Widget _buildMessageTextFormField() {
    return TextFormField(
      maxLines: null,
      focusNode: _messageFocusNode,
      decoration: InputDecoration(labelText: 'Message'),
      validator: (String value) {
        if (value.isEmpty) return 'Message is required.';
      },
      onSaved: (String value) => _message = value,
      onEditingComplete: () => _messageFocusNode.unfocus(),
    );
  }

  Widget _buildSubmitButton() {
    return RaisedButton(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Text(
        'Submit',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          _contact();
        }
      },
    );
  }

  @override
  void dispose() {
    _messageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildNameTextFormField(),
            _buildMessageTextFormField(),
            SizedBox(
              height: 20,
            ),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }
}
