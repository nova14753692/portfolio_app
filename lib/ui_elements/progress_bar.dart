import 'package:flutter/material.dart';

class ProgressBar {
  final double _horizontalPaddingPercent;
  final double _rowPadding;
  final bool _hasPercentIndicator;

  ProgressBar(
      [this._horizontalPaddingPercent = 0,
      this._rowPadding = 0,
      this._hasPercentIndicator = true]);

  double getWidthPerDiv(BuildContext context, int totalFlex, int flexPerDiv,
      double percentPerDiv) {
    if (percentPerDiv < 0) percentPerDiv = 0;
    double deviceWidth = MediaQuery.of(context).size.width;
    double totalWidth = deviceWidth * (1 - _horizontalPaddingPercent / 100);
    double widthPerFlex = totalWidth / totalFlex;
    double widthPerDiv = flexPerDiv * widthPerFlex;
    return percentPerDiv / 100 * widthPerDiv;
  }

  List<double> calculatedAllWidth(
      BuildContext context, int totalFlex, int flexPerDiv, double percent) {
    final List<double> percentPerDiv = [0, 0, 0, 0];
    final List<double> divWidths = [0, 0, 0, 0];
    for (int i = 0; i < 4; i++) {
      if (percent - 25 >= 0) {
        percentPerDiv[i] = 100;
        percent -= 25;
      } else {
        percentPerDiv[i] = percent * 100 / 25;
        break;
      }
    }
    for (int i = 0; i < 4; i++) {
      divWidths[i] =
          getWidthPerDiv(context, totalFlex, flexPerDiv, percentPerDiv[i]);
    }
    return divWidths;
  }

  bool _isLastDiv(int currentDivIndex, List<double> divWidths) {
    if (currentDivIndex == divWidths.length - 1)
      return true;
    else if (currentDivIndex + 1 < divWidths.length &&
        divWidths[currentDivIndex + 1] == 0)
      return true;
    else
      return false;
  }

  BoxDecoration _divDecoration(
      Color color, List<double> divWidths, int divWidthIndex) {
    if (_isLastDiv(divWidthIndex, divWidths))
      return BoxDecoration(
        color: color,
        borderRadius: divWidthIndex == 0
            ? BorderRadius.circular(5)
            : BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
      );
    else
      return BoxDecoration(
        color: color,
        borderRadius: divWidthIndex == 0
            ? BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              )
            : null,
      );
  }

  Widget _buildDiv(double divWidth,
      {BoxDecoration decoration: const BoxDecoration(color: Colors.transparent),
      EdgeInsets margin}) {
    return Flexible(
      fit: FlexFit.loose,
      flex: 4,
      child: Container(
        height: 24,
        width: divWidth,
        decoration: decoration,
        margin: margin,
      ),
    );
  }

  Widget buildProgressBarFrame(double frameWidth) {
    return Container(
      padding: EdgeInsets.all(_rowPadding),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildDiv(frameWidth),
          _buildDiv(frameWidth),
          _buildDiv(frameWidth),
          _buildDiv(frameWidth),
          _buildDiv(frameWidth,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              margin: EdgeInsets.only(right: 1)),
          Expanded(
            flex: 2,
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget buildProgressBar(List<double> divWidths, double currentPercent) {
    return Container(
      padding: EdgeInsets.all(_rowPadding),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildDiv(
            divWidths[0],
            decoration: _divDecoration(Colors.black26, divWidths, 0),
          ),
          _buildDiv(
            divWidths[1],
            decoration: _divDecoration(Colors.black45, divWidths, 1),
          ),
          _buildDiv(
            divWidths[2],
            decoration: _divDecoration(Colors.black54, divWidths, 2),
          ),
          _buildDiv(
            divWidths[3],
            decoration: _divDecoration(Colors.black87, divWidths, 3),
          ),
          Expanded(
            flex: 2,
            child: _hasPercentIndicator
                ? Text(
                    currentPercent.toInt().toString() + '%',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
