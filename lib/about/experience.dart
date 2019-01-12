import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:scoped_model/scoped_model.dart';

import '../scoped_model/exp_scoped_model.dart';

import '../ui_elements/exp_progress.dart';
import '../ui_elements/progress_bar.dart';

class Experience extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Experience();
  }
}

class _Experience extends State<Experience> with TickerProviderStateMixin {
  static final double horizontalPaddingPercent = 5;
  final List<ExpProgress> expProgressBars = [
    ExpProgress('C++', 60, horizontalPaddingPercent),
    ExpProgress('C#', 60, horizontalPaddingPercent, 0.1),
    ExpProgress('Java', 65, horizontalPaddingPercent, 0.2),
    ExpProgress('Dart', 35, horizontalPaddingPercent, 0.3),
    ExpProgress('ReactJs', 30, horizontalPaddingPercent, 0.4),
    ExpProgress('Blender3D', 50, horizontalPaddingPercent, 0.4, 2000),
    ExpProgress('Unity3D Engine', 85, horizontalPaddingPercent, 0.3, 2500),
    ExpProgress('Android Native', 45, horizontalPaddingPercent, 0.4, 2500),
    ExpProgress('Flutter Android/iOS', 65, horizontalPaddingPercent, 0.5, 2500),
  ];

  AnimationController _animController;
  ExpScopedModel _model;

  Widget _buildLegendDiv(String legend, double progressBarFrameWidth) {
    return Flexible(
      flex: 4,
      fit: FlexFit.loose,
      child: Container(
          width: progressBarFrameWidth,
          child: Text(
            legend,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          )),
    );
  }

  Widget _buildLegend(BuildContext context, double horizontalPaddingPercent) {
    ProgressBar progressBar =
        ProgressBar(100, horizontalPaddingPercent, 2, false);
    double progressBarFrameWidth =
        progressBar.getWidthPerDiv(context, 18, 4, 100);
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildLegendDiv('Beginner', progressBarFrameWidth),
            _buildLegendDiv('Intermediate', progressBarFrameWidth),
            _buildLegendDiv('Proficient', progressBarFrameWidth),
            _buildLegendDiv('Expert', progressBarFrameWidth),
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Container(),
            ),
          ],
        ),
        progressBar.buildProgressBar(
            progressBar.calculatedAllWidth(context, 18, 4, 100)),
      ],
    );
  }

  Widget _buildRefreshAnimationButton() {
    return ScopedModelDescendant<ExpScopedModel>(
        builder: (BuildContext context, Widget child, ExpScopedModel model) {
      return Container(
        padding: EdgeInsets.only(bottom: 7),
        child: AnimatedBuilder(
          animation: _animController,
          builder: (BuildContext context, Widget child) {
            return Transform.rotate(
              angle: _animController.value * 2 * math.pi,
              child: IconButton(
                  icon: Icon(Icons.refresh),
                  iconSize: 36,
                  onPressed: () {
                    _model = model;
                    _animController.repeat();
                    model.rebuildExpProgressBars();
                  }),
            );
          },
        ),
      );
    });
  }

  Widget _buildExpProgressBars(double horizontalPaddingPercent) {
    return Column(
      children: expProgressBars,
    );
  }

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _animController.addListener(() {
      if (_model != null) {
        if (_model.isAllAnimControllerCompleted())
          _animController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPaddingPercent / 100 * deviceWidth),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Experience',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.redAccent),
                  textAlign: TextAlign.left,
                ),
              ),
              _buildRefreshAnimationButton(),
            ],
          ),
          _buildLegend(context, horizontalPaddingPercent),
          _buildExpProgressBars(horizontalPaddingPercent),
        ],
      ),
    );
  }
}
