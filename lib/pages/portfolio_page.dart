import 'package:flutter/material.dart';

import '../ui_elements/header.dart';
import '../ui_elements/app_drawer.dart';

class PortfolioPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final String heroTag;

  PortfolioPage(this.heroTag);

  String _paragraphBuilder(List<String> sentences) {
    String result = '';
    sentences.forEach((String sentence) => result += sentence);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final String textBody = _paragraphBuilder([
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin posuere mollis imperdiet. ',
      'Sed a quam lorem. Praesent aliquet massa metus, sit amet interdum sem blandit non. ',
      'Donec semper, nulla at finibus aliquet, orci elit scelerisque sapien, sit amet rutrum ',
      'velit lacus at lacus. Cras efficitur orci ligula, condimentum dignissim massa pellentesque in. ',
      'Duis venenatis, elit nec iaculis interdum, leo metus hendrerit sem, quis dignissim purus neque ',
      'at urna. Vivamus rhoncus ornare diam quis commodo. Praesent malesuada purus diam, ac lacinia sapien ',
      'laoreet vitae. Aliquam ac mi eu turpis placerat vulputate quis placerat turpis.\n\n',
      'Morbi ultrices, nisl ac imperdiet feugiat, erat felis tincidunt velit, et imperdiet ',
      'felis mauris volutpat nisl. Nam ac volutpat leo, eu facilisis orci. Suspendisse potenti. ',
      'Proin faucibus enim massa, ut fringilla enim mollis sit amet. Pellentesque est orci, convallis ',
      'sit amet molestie nec, auctor in ligula. Pellentesque vitae lectus sem. Curabitur vehicula, massa ',
      'eget pulvinar commodo, orci nisi fringilla elit, at elementum ligula erat facilisis lacus. Etiam ',
      'sagittis massa vel porttitor viverra. Pellentesque sit amet egestas elit. Duis tincidunt elementum ',
      'urna sed aliquet.\n\n',
      'Nunc rutrum nibh et tellus molestie, tempor luctus enim ullamcorper. Aenean venenatis rutrum dolor, ',
      'in viverra enim. Nam fringilla dolor et diam scelerisque luctus. Curabitur sollicitudin, lacus at ',
      'commodo euismod, ex massa lacinia leo, sed pellentesque urna nunc a quam. Maecenas lacus risus, ',
      'consequat eu imperdiet quis, tristique a nisl. Nulla sodales gravida ante. Duis id justo ultricies, ',
      'placerat orci at, convallis nibh. Praesent aliquet diam vitae magna pellentesque, ut aliquet sem ',
      'facilisis. Mauris cursus, diam vel pharetra suscipit, lectus lorem lacinia turpis, efficitur placerat ',
      'ipsum sem placerat nisl. Sed et ipsum sem. Sed justo diam, vehicula sed aliquam in, facilisis ut dolor.\n\n',
      'Suspendisse a pellentesque orci. In nec condimentum lorem, ut ultrices elit. Donec velit lacus, ',
      'aliquet eu feugiat id, consequat nec nulla. Nulla facilisi. Suspendisse consequat orci quis ultrices ',
      'condimentum. Donec aliquam quam vel ultrices hendrerit. Vestibulum enim nisi, aliquet consequat ',
      'cursus non, suscipit id diam. Duis ullamcorper maximus sodales. Aenean aliquet aliquet elit, ',
      'sed mollis mi pharetra vel. Sed ornare mattis maximus. Donec ut arcu ac libero fermentum sodales. ',
      'Sed magna augue, tempor vel mauris vitae, fringilla elementum neque. Aenean sit amet ex purus. ',
      'Sed in tortor in metus tristique posuere. Proin sem quam, commodo vitae bibendum sit amet, posuere ',
      'ac orci.\n\n',
      'Vestibulum commodo laoreet lorem, in venenatis ipsum gravida vitae. Aliquam erat volutpat. ',
      'Aliquam commodo, neque eget ultricies porta, quam libero tempor justo, a scelerisque metus lorem ',
      'tincidunt ipsum. Morbi tincidunt elementum pharetra. Donec pretium erat quis diam porttitor ',
      'pellentesque. Duis at ante eget est lacinia volutpat. Duis non sem non purus accumsan facilisis. ',
      'Vestibulum id porttitor massa. Donec ullamcorper sem viverra massa lobortis, quis suscipit mauris ',
      'pellentesque. Nam condimentum accumsan magna eget facilisis. Aliquam quis eros orci.\n\n'
    ]);
    return Scaffold(
      drawer: AppDrawer(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: Header(
                maxHeight: MediaQuery.of(context).size.height,
                minHeight: 90,
                scrollController: _scrollController,
                backButton: true,
                coverImageUrl: 'assets/portfolio_card_image.jpg',
                appbarTitle: 'Selena Revenge',
                openButtonText: 'See the game',
                heroTag: heroTag),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'Selena Revenge',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  textBody,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
