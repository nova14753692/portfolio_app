import 'package:flutter/material.dart';

class Perk extends StatelessWidget {
  final List<String> _perks;

  Perk(this._perks);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Image.asset('assets/hexagon.png'),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    _perks[index],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      }, childCount: 4),
    );
  }
}
