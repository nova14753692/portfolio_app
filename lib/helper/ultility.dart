import 'package:flutter/material.dart';

class Utility {
  static ScrollController scrollController;
  static void scrollTo(double offset,
      {ScrollController controller, int duration: 500}) {
    if (controller != null) {
      controller.animateTo(offset,
          duration: Duration(milliseconds: duration), curve: Curves.easeIn);
    } else if (scrollController != null) {
      scrollController.animateTo(offset,
          duration: Duration(milliseconds: duration), curve: Curves.easeIn);
    } else
      print('scrollController is null');
  }

  static void scrollToBottom([int duration = 500]) {
    if (scrollController != null)
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: duration), curve: Curves.easeIn);
    else
      print('scrollController is null');
  }
}
