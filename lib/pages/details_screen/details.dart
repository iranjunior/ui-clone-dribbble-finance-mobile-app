import 'package:cards_control/models/models.dart';
import 'package:cards_control/pages/details_screen/widgets/list_tile_doubt.dart';
import 'package:cards_control/pages/details_screen/widgets/widgets.dart';
import 'package:cards_control/widgets/base_page.dart';
import 'package:cards_control/widgets/chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final List<TransactionsModel> itens = [
    TransactionsModel(
      title: 'Food',
      image: AssetImage('assets/food.png'),
      description: 'K Food restaurant payment',
      value: 145,
    ),
    TransactionsModel(
      title: 'Taxi',
      image: AssetImage('assets/taxi.png'),
      description: 'axi payment for office',
      value: 25.0,
    ),
    TransactionsModel(
      title: 'Netflix',
      image: AssetImage('assets/netflix.png'),
      description: 'Mostly payment of Netflix',
      value: 22.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      hideBottomNavigationBar: true,
      invertGradient: true,
      appBar: AppBarDetailPage(),
      page: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 2,
            child: Accumalated(),
          ),
          Flexible(flex: 4, child: LinearChat()),
          Spacer(),
          Expanded(
            flex: 5,
            child: ListDoubt(
              doubts: itens,
            ),
          ),
        ],
      ),
    );
  }
}
