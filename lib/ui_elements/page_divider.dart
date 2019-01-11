import 'package:flutter/material.dart';

import '../ui_elements/divider.dart' as div;

class PageDivider extends div.Divider {
  PageDivider({color: Colors.black, width: 3.0})
      : super(color: color, width: width);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: buildDivider(),
    );
  }
}
