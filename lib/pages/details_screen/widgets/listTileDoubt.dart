import 'package:flutter/material.dart';

class ListTileDoubt extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final double value;
  final bool divider;

  const ListTileDoubt({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.value,
    required this.divider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              'assets/${this.icon}',
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
                    '\$${this.value}',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 24,),
        this.divider ? dividerWidget() : SizedBox.shrink(),
        SizedBox(height: 24,),
      ],
    );
  }

  Widget dividerWidget() {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: Axis.horizontal,
      children: List.generate(
          15,
          (index) => Container(
                height: 2,
                width: 12,
                color: Color(0xff373737),
                child: SizedBox(
                  width: 3,
                ),
              )),
    );
  }
}
