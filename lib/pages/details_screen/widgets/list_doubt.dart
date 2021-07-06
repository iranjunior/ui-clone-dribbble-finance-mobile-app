import 'package:cards_control/models/models.dart';
import 'package:flutter/material.dart';
import 'list_tile_doubt.dart';

class ListDoubt extends StatelessWidget {
  const ListDoubt({
    Key? key,
    required this.doubts,
  }) : super(key: key);

  final List<TransactionsModel> doubts;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: ListView.separated(
          itemCount: this.doubts.length,
          separatorBuilder: (context, index) {
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
                ),
              ),
            );
          },
          itemBuilder: (context, index) {
            return ListTileDoubt(
                title: doubts[index].title,
                description: doubts[index].description,
                icon: doubts[index].image,
                value: doubts[index].value);
          },
        ),
      ),
    );
  }
}
