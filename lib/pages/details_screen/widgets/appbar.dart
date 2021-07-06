import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class AppBarDetailPage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDetailPage({
    Key? key,
  }) : super(key: key);
  get preferredSize => Size.fromHeight(56.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
