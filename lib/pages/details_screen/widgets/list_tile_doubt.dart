import 'package:flutter/material.dart';

import 'package:cards_control/extensions/concurrency.dart';

class ListTileDoubt extends StatelessWidget {
  final String title;
  final String description;
  final AssetImage icon;
  final double value;

  const ListTileDoubt({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image(
              image: this.icon,
              fit: BoxFit.fitWidth,
              height: 32,
              width: 32,
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.title,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    this.description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$ ${this.value.formatToMoney()}',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
