import 'package:flutter/material.dart';

import '../contact/contact.dart';
import '../ui_elements/page_title.dart';
import '../ui_elements/header.dart';
import '../ui_elements/app_drawer.dart';
import '../helper/unfocus_node.dart';

class ContactPage extends StatelessWidget {
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
                appbarTitle: 'Contact',
                openButtonText: 'Contact Me',
              ),
            ),
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
            )
          ],
        ),
      ),
    );
  }
}
