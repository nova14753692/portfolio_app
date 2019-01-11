import 'package:flutter/material.dart';

import '../models/portfolio_model.dart';

class PortfolioCard extends StatelessWidget {
  final PortfolioModel _portfolioModel;
  final int _cardIndex;

  PortfolioCard(this._portfolioModel, this._cardIndex);

  Widget _buildCardImage() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Hero(
        tag: _portfolioModel.getPortfolios[_cardIndex].route,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child:
              Image.asset(_portfolioModel.getPortfolios[_cardIndex].imageUrl),
        ),
      ),
    );
  }

  Widget _buildCardTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        _portfolioModel.getPortfolios[_cardIndex].title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  Widget _buildCardDescription() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        _portfolioModel.getPortfolios[_cardIndex].description,
        style: TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDetailButton(BuildContext context) {
    return RaisedButton(
      color: Colors.black54,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        'See detail',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onPressed: () => Navigator.pushNamed(context,
          '/portfolio/${_portfolioModel.getPortfolios[_cardIndex].route}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            _buildCardImage(),
            _buildCardTitle(),
            SizedBox(
              height: 10,
            ),
            _buildCardDescription(),
            SizedBox(
              height: 20,
            ),
            _buildDetailButton(context),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
