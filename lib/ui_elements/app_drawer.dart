import 'package:flutter/material.dart';

import './divider.dart' as div;
import '../helper/ultility.dart';

abstract class AppDrawer extends StatelessWidget {
  final ScrollController scrollController;

  AppDrawer({this.scrollController}) {
    Utility.scrollController = scrollController;
  }

  void onDrawerItemTap(double offset, BuildContext context);

  Widget _buildDrawerItem(
      BuildContext context, String title, IconData leadingIcon, double scrollOffset) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 30, bottom: 10),
      leading: Icon(
        leadingIcon,
        color: Colors.white,
        size: 36,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      onTap: () => onDrawerItemTap(scrollOffset, context),
    );
  }

  Widget _buildDrawerHeaderFooter(BuildContext context, String imagePath,
      {bool header: true}) {
    return _isInPortraitMode(context)
        ? Container(
            child: ClipRRect(
              borderRadius: header
                  ? BorderRadius.vertical(bottom: Radius.circular(20))
                  : BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(imagePath),
            ),
          )
        : Container();
  }

  bool _isInPortraitMode(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  Widget buildDrawer(BuildContext context) {
    double aboutPos = _isInPortraitMode(context) ? 600 : 331.4;
    double portfolioPos = _isInPortraitMode(context) ? 2100 : 2080;
    double contactPos = _isInPortraitMode(context) ? 3565.7 : 3239.1;
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.black87,
          ),
          Column(
            children: <Widget>[
              _buildDrawerHeaderFooter(
                  context, 'assets/meteors_landscaped.jpg'),
              SizedBox(
                height: 20,
              ),
              div.Divider(color: Colors.white54, width: 2),
              SizedBox(
                height: 20,
              ),
              _buildDrawerItem(context, 'About', Icons.account_box, aboutPos),
              _buildDrawerItem(context, 'Portfolio', Icons.apps, portfolioPos),
              _buildDrawerItem(context, 'Contact', Icons.contact_mail, contactPos),
              div.Divider(color: Colors.white54, width: 2),
            ],
          ),
          Column(
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              _buildDrawerHeaderFooter(context, 'assets/scene1.jpg',
                  header: false),
            ],
          )
        ],
      ),
    );
  }
}
