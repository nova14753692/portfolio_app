class PortfolioModel {
  final List<_PortfolioInfo> _portfolios = [
    _PortfolioInfo(
        'title1',
        'assets/portfolio_card_image.jpg',
        'Lorem ipsum began as scrambled, nonsensical Latin derived from Cicero 1st-century',
        'discord_clone'),
    _PortfolioInfo(
        'title2',
        'assets/portfolio_card_image.jpg',
        'Lorem ipsum began as scrambled, nonsensical Latin derived from Cicero 1st-century',
        'flutter_shop'),
    _PortfolioInfo(
        'title3',
        'assets/portfolio_card_image.jpg',
        'Lorem ipsum began as scrambled, nonsensical Latin derived from Cicero 1st-century',
        'selena_revenge'),
  ];

  List<_PortfolioInfo> get getPortfolios => List.from(_portfolios);
}

class _PortfolioInfo {
  final String title;
  final String imageUrl;
  final String description;
  final String route;

  _PortfolioInfo(this.title, this.imageUrl, this.description, this.route);
}
