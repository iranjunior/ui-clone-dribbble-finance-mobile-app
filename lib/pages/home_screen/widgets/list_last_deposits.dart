import 'package:cards_control/models/models.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'package:cards_control/extensions/concurrency.dart';

final typesIcons = {
  'salary': UniconsLine.bag,
  'paypal': UniconsLine.paypal,
};

class ListLastDeposit extends StatelessWidget {
  const ListLastDeposit({
    Key? key,
    required this.listLastDeposit,
  }) : super(key: key);

  final List<DepositModel> listLastDeposit;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: listLastDeposit
          .map<DepositWidget>(
            (deposit) => DepositWidget(
              icon: typesIcons[deposit.type] ?? UniconsLine.money_withdraw,
              title: deposit.name,
              description: deposit.description,
              value: deposit.value,
            ),
          )
          .toList(),
    );
  }
}

class DepositWidget extends StatelessWidget {
  const DepositWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.value,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String description;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 160,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color(0xff000402),
            ],
            begin: Alignment(-9.0, 0),
            end: Alignment(0, 0),
          ),
          borderRadius: BorderRadius.circular(40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            this.icon,
            color: Colors.white,
            size: 28.0,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            this.title,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            this.description,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            this.value > 0
                ? '+\$ ${this.value.formatToMoney()}'
                : '-\$ ${this.value.formatToMoney()}',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
