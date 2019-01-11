import 'package:flutter/material.dart';

import '../models/about_model.dart';

import '../ui_elements/header.dart';
import '../about/perk.dart';
import '../about/about.dart';
import '../portfolio/portfolio_list.dart';
import '../ui_elements/page_title.dart';
import '../contact/contact.dart';
import '../ui_elements/divider.dart' as div;
import '../ui_elements/home_drawer.dart';

class Home extends StatelessWidget {
  final AboutModel _aboutModel = AboutModel();
  final ScrollController _scrollController = ScrollController();

  Widget _buildPageDivider([color = Colors.black, double width = 3]) {
    return SliverToBoxAdapter(
      child: div.Divider(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(_scrollController),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        onVerticalDragDown: (DragDownDetails detail) =>
            FocusScope.of(context).requestFocus(FocusNode()),
        onHorizontalDragDown: (DragDownDetails detail) =>
            FocusScope.of(context).requestFocus(FocusNode()),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: Header(
                  maxHeight: MediaQuery.of(context).size.height,
                  minHeight: 80,
                  scrollController: _scrollController),
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
            _buildPageDivider(),
            SliverPadding(
              padding: EdgeInsets.only(top: 40),
              sliver: About(_aboutModel),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.black54,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(bottom: 30),
                child: PageTitle('Portfolio', Colors.white),
              ),
            ),
            PortfolioList(),
            _buildPageDivider(),
            SliverToBoxAdapter(
              child: Container(
                child: PageTitle('Contact'),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverToBoxAdapter(
                child: Contact(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
