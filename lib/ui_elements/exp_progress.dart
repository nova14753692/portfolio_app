import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped_model/exp_scoped_model.dart';

import './progress_bar.dart';

class AnimatedProgressBar extends AnimatedWidget {
  final Tween<double> _percentTween;
  final ExpProgress _widget;
  final ProgressBar _progressBar;

  AnimatedProgressBar(this._widget, this._percentTween, this._progressBar,
      {Key key, Animation<double> anim})
      : super(key: key, listenable: anim) {
    _percentTween.animate(anim);
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> anim = listenable;
    final frameWidth = _progressBar.getWidthPerDiv(context, 18, 4, 100);
    final double currentPercent = _percentTween.evaluate(anim);
    final List<double> divWidths =
        _progressBar.calculatedAllWidth(context, 18, 4, currentPercent);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          _widget._label,
          style: TextStyle(fontSize: 20),
        ),
        Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 30,
            ),
            _progressBar.buildProgressBar(divWidths, currentPercent),
            _progressBar.buildProgressBarFrame(frameWidth),
          ],
        )
      ],
    );
  }
}

class ExpProgress extends StatefulWidget {
  final String _label;
  final double _percent;
  final double _rowPadding = 3;
  final double _horizontalPaddingPercent;
  final double _animDelay;
  final int _durationMilliseconds;

  ExpProgress(this._label, this._percent,
      [this._horizontalPaddingPercent = 0,
      this._animDelay = 0,
      this._durationMilliseconds = 1500]);

  @override
  State<StatefulWidget> createState() {
    return _ExpProgress();
  }
}

class _ExpProgress extends State<ExpProgress> with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<double> _anim;
  ExpScopedModel _model;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget._durationMilliseconds));
    _anim = CurvedAnimation(
        parent: _animController,
        curve: Interval(widget._animDelay, 1.0, curve: Curves.ease));
    _animController.forward();
  }

  @override
  void dispose() {
    if (_model != null) _model.removeAnimController(_animController);
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ExpScopedModel>(
      builder: (BuildContext context, Widget child, ExpScopedModel model) {
        model.addAnimController(_animController);
        _model = model;
        return AnimatedProgressBar(
            widget,
            Tween<double>(begin: 0, end: widget._percent),
            ProgressBar(widget._horizontalPaddingPercent, widget._rowPadding),
            anim: _anim);
      },
    );
  }
}
