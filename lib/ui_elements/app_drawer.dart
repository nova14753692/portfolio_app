import 'package:flutter/material.dart';

import './divider.dart' as div;

class AppDrawer extends StatelessWidget {
  void _onDrawerItemTap(BuildContext context, String route) {
    Navigator.pushReplacementNamed(context, route);
  }

  Widget _buildDrawerItem(
      BuildContext context, String title, IconData leadingIcon, String route) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 30),
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
      onTap: () => _onDrawerItemTap(context, route),
    );
  }

  Widget _buildDrawerHeaderFooter(BuildContext context, String imagePath,
      {bool header: true}) {
    return _hasEnoughSpace(context)
        ? Container(
            child: ClipRRect(
              borderRadius: header
                  ? BorderRadius.vertical(bottom: Radius.circular(20))
                  : BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(imagePath),
            ),
          )
        : Container(
            height: 50,
          );
  }

  bool _hasEnoughSpace(BuildContext context) {
    return MediaQuery.of(context).size.height >= 600;
  }

  Widget _buildDrawer(BuildContext context) {
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
              div.Divider(color: Colors.white54, width: 2),
              _buildDrawerItem(context, 'All', Icons.list, '/'),
              _buildDrawerItem(context, 'About', Icons.account_box, '/about'),
              _buildDrawerItem(
                  context, 'Portfolio', Icons.apps, '/portfolio_list'),
              _buildDrawerItem(
                  context, 'Contact', Icons.contact_mail, '/contact'),
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

  @override
  Widget build(BuildContext context) {
    return _buildDrawer(context);
  }
}
