import 'package:flutter/material.dart';

import '../models/about_model.dart';

import '../ui_elements/page_title.dart';
import '../about/perk.dart';
import '../about/about.dart';
import '../ui_elements/page_divider.dart';
import '../ui_elements/header.dart';
import '../ui_elements/app_drawer.dart';

class AboutPage extends StatelessWidget {
  final AboutModel _aboutModel = AboutModel();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: Header(
              maxHeight: MediaQuery.of(context).size.height,
              minHeight: 90,
              scrollController: _scrollController,
              appbarTitle: 'About Me',
              openButtonText: 'Hear my story',
            ),
          ),
          SliverToBoxAdapter(
            child: PageTitle('About'),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
            ),
            sliver: Perk(_aboutModel.getPerks),
          ),
          PageDivider(),
          SliverPadding(
            padding: EdgeInsets.only(top: 40, bottom: 50),
            sliver: About(_aboutModel),
          ),
        ],
      ),
    );
  }
}
