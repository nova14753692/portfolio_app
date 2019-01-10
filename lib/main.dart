import 'package:flutter/material.dart';

import './pages/home.dart';
import './helper/custom_route.dart';
import './pages/portfolio_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  Route<dynamic> setupOnGenerateRoute(RouteSettings settings) {
    final List<String> paths = settings.name.split('/');
    if (paths[0].isNotEmpty) return null;
    if (paths[1] == 'portfolio') {
      switch (paths[2]) {
        case 'discord_clone':
          return CustomRoute<bool>(
              builder: (BuildContext context) => PortfolioPage());
        case 'flutter_shop':
          return CustomRoute<bool>(
              builder: (BuildContext context) => PortfolioPage());
        case 'selena_revenge':
          return CustomRoute<bool>(
              builder: (BuildContext context) => PortfolioPage());
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      onGenerateRoute: (RouteSettings settings) =>
          setupOnGenerateRoute(settings),
    );
  }
}
