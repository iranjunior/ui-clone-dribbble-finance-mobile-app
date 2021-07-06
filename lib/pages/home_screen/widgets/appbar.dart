import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppBarHomePage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomePage({
    Key? key,
  }) : super(key: key);
  get preferredSize => Size.fromHeight(56.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: false,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppLocalizations.of(context).greetingUser} Ghaulam',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 8,
          ),
          Text(AppLocalizations.of(context).greeting,
              style: Theme.of(context).textTheme.subtitle1),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/avatar.png'),
            radius: 24.0,
          ),
        ),
      ],
    );
  }
}
