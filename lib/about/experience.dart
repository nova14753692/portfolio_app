import 'package:flutter/material.dart';

import '../ui_elements/exp_progress.dart';
import '../ui_elements/progress_bar.dart';

class Experience extends StatelessWidget {
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
    ProgressBar progressBar = ProgressBar(100, horizontalPaddingPercent, 2);
    double progressBarFrameWidth =
        progressBar.getWidthPerDiv(context, 18, 4, 100);
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            'Experience',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.redAccent),
            textAlign: TextAlign.left,
          ),
        ),
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

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double horizontalPaddingPercent = 5;

    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPaddingPercent / 100 * deviceWidth),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            _buildLegend(context, horizontalPaddingPercent),
            ExpProgress('C++', 60, horizontalPaddingPercent),
            ExpProgress('C#', 60, horizontalPaddingPercent, 0.1),
            ExpProgress('Java', 65, horizontalPaddingPercent, 0.2),
            ExpProgress('Dart', 35, horizontalPaddingPercent, 0.3),
            ExpProgress('ReactJs', 30, horizontalPaddingPercent, 0.4),
            ExpProgress('Blender3D', 50, horizontalPaddingPercent, 0.4, 2000),
            ExpProgress(
                'Unity3D Engine', 85, horizontalPaddingPercent, 0.3, 2500),
            ExpProgress(
                'Android Native', 45, horizontalPaddingPercent, 0.4, 2500),
            ExpProgress(
                'Flutter Android/iOS', 65, horizontalPaddingPercent, 0.5, 2500),
          ],
        ));
  }
}
