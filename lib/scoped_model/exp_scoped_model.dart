import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ExpScopedModel extends Model {
  List<AnimationController> _animControllers = [];

  List<AnimationController> get getAnimControllers =>
      List.from(_animControllers);

  void addAnimController(AnimationController animController) {
    if (!_animControllers.contains(animController))
      _animControllers.add(animController);
  }

  void removeAnimController(AnimationController animController) =>
      _animControllers.remove(animController);

  bool isAllAnimControllerCompleted() {
    for (AnimationController animController in _animControllers) {
      if (animController.isAnimating) return false;
    }
    if (_animControllers.length == 0) return false;
    return true;
  }

  void rebuildExpProgressBars() {
    _animControllers.forEach((AnimationController animController) {
      animController.reset();
      animController.forward();
    });
  }
}
