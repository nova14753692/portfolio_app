import 'package:flutter/material.dart';

import '../models/about_model.dart';

import '../ui_elements/header.dart';
import '../about/perk.dart';
import '../about/about.dart';
import '../portfolio/portfolio_list.dart';
import '../ui_elements/page_title.dart';
import '../contact/contact.dart';
import '../ui_elements/page_divider.dart';
import '../ui_elements/app_drawer.dart';
import '../helper/unfocus_node.dart';

class Home extends StatelessWidget {
  final AboutModel _aboutModel = AboutModel();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: UnfocusNode().unfocusNode(
        context,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: Header(
                maxHeight: MediaQuery.of(context).size.height,
                minHeight: 90,
                scrollController: _scrollController,
                hamburger: true,
                appbarTitle: 'Vincent Tran\'s Portfolio',
                openButtonText: 'See what\'s inside',
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
            PageDivider(),
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
