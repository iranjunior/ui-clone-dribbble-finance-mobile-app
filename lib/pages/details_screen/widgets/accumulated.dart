import 'package:flutter/material.dart';

import 'package:cards_control/extensions/concurrency.dart';

class Accumalated extends StatelessWidget {
  const Accumalated({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Valor acumulado esse mês',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 8),
              Text(
                '\$ ${5999.formatToMoney()}',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
