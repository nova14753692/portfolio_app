import 'package:flutter/material.dart';

import '../portfolio/portfolio_list.dart';
import '../ui_elements/page_title.dart';
import '../ui_elements/header.dart';
import '../ui_elements/app_drawer.dart';

class PortfolioListPage extends StatelessWidget {
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
                minHeight: 80,
                scrollController: _scrollController),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.black54,
              padding: EdgeInsets.only(bottom: 30),
              child: PageTitle('Portfolio', Colors.white),
            ),
          ),
          PortfolioList(),
          SliverToBoxAdapter(
            child: Container(
              height: 50,
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }
}
