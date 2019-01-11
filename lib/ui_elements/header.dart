import 'package:flutter/material.dart';

import '../helper/ultility.dart';

class Header extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final String coverImageUrl;
  final String appbarTitle;
  final String openButtonText;
  final ScrollController scrollController;
  final String heroTag;

  Header(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.scrollController,
      this.coverImageUrl: 'assets/meteors.jpg',
      this.appbarTitle: 'My Portfolio',
      this.openButtonText: 'See my works',
      this.heroTag: ''});

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  Widget _buildCoverImage() {
    return Hero(
      tag: heroTag,
      child: Image.asset(coverImageUrl, fit: BoxFit.cover),
    );
  }

  Widget _buildHeaderTitle(double deviceWidth) {
    return Container(
      width: deviceWidth,
      padding: EdgeInsets.only(left: 30, top: 10),
      child: Text(
        appbarTitle,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildOpenButton(double shrinkOffset, double deviceHeight) {
    return shrinkOffset >= maxHeight - minHeight - 60
        ? Container()
        : Expanded(
            child: Center(
              child: RaisedButton(
                color: Colors.redAccent,
                textColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Text(
                  openButtonText,
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () => Utility.scrollTo(deviceHeight - minHeight,
                    controller: scrollController),
              ),
            ),
          );
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.clip,
      children: <Widget>[
        _buildCoverImage(),
        Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            _buildHeaderTitle(deviceWidth),
            _buildOpenButton(shrinkOffset, deviceHeight),
          ],
        )
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
