import 'package:cards_control/pages/details_screen/widgets/listTileDoubt.dart';
import 'package:cards_control/widgets/base_page.dart';
import 'package:cards_control/widgets/chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final List<Map<String, dynamic>> itens = [
    {
      'type': 'Food',
      'description': 'K Food restaurant payment',
      'value': 145.0,
      'icon': 'food.png',
    },
    {
      'type': 'Taxi',
      'description': 'Taxi payment for office',
      'value': 25.0,
      'icon': 'taxi.png',
    },
    {
      'type': 'Netflix',
      'description': 'Mostly payment of Netflix',
      'value': 22.0,
      'icon': 'netflix.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      hideBottomNavigationBar: true,
      invertGradient: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff26262F)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              UniconsLine.arrow_left,
              size: 28,
              color: Color(0xff7D7D86),
            ),
          ),
          label: SizedBox.shrink(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.more_vert, color: Color(0xff90C4AD)),
          )
        ],
      ),
      page: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).savedThisMonth,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$5,999.00',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(flex: 4, child: LinearChat()),
          Spacer(),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Color(0xff000402),
                  ],
                  begin: Alignment(-9.0, 0),
                  end: Alignment(0, 0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 32.0,
                ),
                child: ListView.builder(
                    itemCount: itens.length,
                    itemBuilder: (context, index) {
                      return ListTileDoubt(
                          divider: index < itens.length - 1,
                          title: itens[index]['type'],
                          description: itens[index]['description'],
                          icon: itens[index]['icon'],
                          value: itens[index]['value']);
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
