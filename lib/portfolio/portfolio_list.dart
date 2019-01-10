import 'package:flutter/material.dart';

import '../models/portfolio_model.dart';

import '../portfolio/portfolio_card.dart';

class PortfolioList extends StatelessWidget {
  final PortfolioModel _portfolioModel = PortfolioModel();
  final int _cardPerRow = 2;

  Widget _buildPortfolioListLandscapeMode() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Row(
          children: <Widget>[
            Flexible(
              child: PortfolioCard(_portfolioModel, index * _cardPerRow),
            ),
            index * _cardPerRow + 1 < _portfolioModel.getPortfolios.length
                ? Flexible(
                    child:
                        PortfolioCard(_portfolioModel, index * _cardPerRow + 1),
                  )
                : Container(),
          ],
        );
      },
          childCount:
              (_portfolioModel.getPortfolios.length / _cardPerRow).ceil()),
    );
  }

  Widget _buildPortfolioListPortraitMode() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return PortfolioCard(_portfolioModel, index);
      }, childCount: _portfolioModel.getPortfolios.length),
    );
  }

  Widget _buildPortfolioList(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait)
      return _buildPortfolioListPortraitMode();
    else
      return _buildPortfolioListLandscapeMode();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPortfolioList(context);
  }
}
