import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

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
    final List<double> divWidths = _progressBar.calculatedAllWidth(
        context, 18, 4, _percentTween.evaluate(anim));
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
            _progressBar.buildProgressBar(divWidths),
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
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedProgressBar(
        widget,
        Tween<double>(begin: 0, end: widget._percent),
        ProgressBar(widget._percent, widget._horizontalPaddingPercent,
            widget._rowPadding),
        anim: _anim);
  }
}
