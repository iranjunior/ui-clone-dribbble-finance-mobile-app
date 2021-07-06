import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:cards_control/extensions/concurrency.dart';
import 'package:cards_control/models/models.dart';

class Balance extends StatelessWidget {
  const Balance({
    Key? key,
    required this.creditCard,
  }) : super(key: key);
  final CreditCardModel creditCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/details',
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).titleBalance,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '\$ ${this.creditCard.balance.formatToMoney()}',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  AppLocalizations.of(context).descriptionBalance,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff5EAE73),
                        Color(0xff2D6337),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        this.creditCard.avg > 0
                            ? CupertinoIcons.arrow_up
                            : CupertinoIcons.arrow_down,
                        size: 14,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${this.creditCard.avg.abs()}%',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
