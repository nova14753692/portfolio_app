import 'package:flutter/material.dart';

class UnfocusNode {
  Widget unfocusNode(BuildContext context, {@required Widget child}) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      onVerticalDragDown: (DragDownDetails detail) =>
          FocusScope.of(context).requestFocus(FocusNode()),
      onHorizontalDragDown: (DragDownDetails detail) =>
          FocusScope.of(context).requestFocus(FocusNode()),
      child: child,
    );
  }
}
