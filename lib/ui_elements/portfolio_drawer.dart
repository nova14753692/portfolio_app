import 'package:flutter/material.dart';

import './app_drawer.dart';
import '../helper/ultility.dart';

class PortfolioDrawer extends AppDrawer {
  PortfolioDrawer(ScrollController scrollController)
      : super(scrollController: scrollController);

  @override
  onDrawerItemTap(double offset, BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
    Utility.scrollTo(offset);
  }

  @override
  Widget build(BuildContext context) {
    return buildDrawer(context);
  }
}
