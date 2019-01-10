import 'package:flutter/material.dart';

import './app_drawer.dart';
import '../helper/ultility.dart';

class HomeDrawer extends AppDrawer {
  HomeDrawer(ScrollController scrollController)
      : super(scrollController: scrollController);

  @override
  onDrawerItemTap(double offset, BuildContext context) {
    Utility.scrollTo(offset);
  }

  @override
  Widget build(BuildContext context) {
    return buildDrawer(context);
  }
}
