import 'package:flutter/material.dart';

class Utility {
  static ScrollController scrollController;
  static void scrollTo(double offset, [int duration = 500]) {
    if (scrollController != null)
      scrollController.animateTo(offset,
          duration: Duration(milliseconds: duration), curve: Curves.easeIn);
    else
      print('scrollController is null');
  }
}
