import 'package:cards_control/models/credit_card.dart';
import 'package:cards_control/pages/home_screen/widgets/widgets.dart';
import 'package:cards_control/models/models.dart';
import 'package:cards_control/widgets/base_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final listLastDeposit = [
    DepositModel.fromMap(
      {
        'name': 'Salário',
        'description': 'Recebido interativo',
        'type': 'salary',
        'value': 2000.0,
      },
    ),
    DepositModel.fromMap(
      {
        'name': 'Paypal',
        'description': 'freelance',
        'type': 'paypal',
        'value': 45.0,
      },
    ),
    DepositModel.fromMap(
      {
        'name': 'Salário',
        'description': 'Recebido interativo',
        'type': 'salary',
        'value': 2125.0,
      },
    ),
  ];
  final currentCreditCard = CreditCardModel(
    holder: 'Ghaulam',
    number: '5505 0671 4553 2642',
    brand: 'mastercard',
    balance: 92510.0,
    avg: -5.9,
  );
  @override
  void initState() {
    super.initState();
    initiSatusBarColor();
  }

  Future<void> initiSatusBarColor() async {
    await FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: AppBarHomePage(),
      page: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 3,
            child: CardCreditSelected(
              currentCreditCard: currentCreditCard,
            ),
          ),
          Flexible(
            child: Balance(
              creditCard: currentCreditCard,
            ),
          ),
          Flexible(
            flex: 2,
            child: ListLastDeposit(
              listLastDeposit: listLastDeposit,
            ),
          ),
        ],
      ),
      hideBottomNavigationBar: false,
    );
  }
}
