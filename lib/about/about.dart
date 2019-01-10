import 'package:flutter/material.dart';

import '../models/about_model.dart';

import 'about_me.dart';
import 'experience.dart';

class About extends StatelessWidget {
  final AboutModel _aboutModel;

  About(this._aboutModel);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        AboutMe(_aboutModel.getAboutMe),
        Experience(),
      ]),
    );
  }
}
