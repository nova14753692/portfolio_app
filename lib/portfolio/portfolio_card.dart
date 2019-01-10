import 'package:flutter/material.dart';

import '../models/portfolio_model.dart';

class PortfolioCard extends StatelessWidget {
  final PortfolioModel _portfolioModel;
  final int _cardIndex;

  PortfolioCard(this._portfolioModel, this._cardIndex);

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
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                    _portfolioModel.getPortfolios[_cardIndex].imageUrl),
              ),
            ),
            Text(
              _portfolioModel.getPortfolios[_cardIndex].title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              _portfolioModel.getPortfolios[_cardIndex].description,
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              color: Colors.redAccent,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Detail',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () => Navigator.pushNamed(context,
                  '/portfolio/${_portfolioModel.getPortfolios[_cardIndex].route}'),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
